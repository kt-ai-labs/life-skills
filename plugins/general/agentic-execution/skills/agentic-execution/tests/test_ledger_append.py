import datetime as dt
import json
import importlib.util
from unittest import mock
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).resolve().parents[1] / "scripts" / "ledger-append.py"
HEADER = b"# Task Ledger\n\n## Current recovery pointer\n\nSee LE999 in another record.\n\n## Events\n\n"


class LedgerAppendTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.path = Path(self.tmp.name) / "task-ledger.md"
        self.path.write_bytes(HEADER)

    def run_append(self, kind, *args, event="D00 started; related LE999."):
        return subprocess.run([sys.executable, str(SCRIPT), str(self.path), "--event", event,
                               "--time-kind", kind, *args], capture_output=True, text=True)

    def success(self, kind, *args, **kwargs):
        result = self.run_append(kind, *args, **kwargs)
        self.assertEqual(result.returncode, 0, result.stderr)
        return json.loads(result.stdout)

    def reject(self, kind, *args, **kwargs):
        before = self.path.read_bytes() if self.path.exists() else None
        result = self.run_append(kind, *args, **kwargs)
        self.assertNotEqual(result.returncode, 0)
        self.assertEqual(self.path.read_bytes() if self.path.exists() else None, before)

    def test_now_and_ids(self):
        start = dt.datetime.now(dt.timezone.utc).replace(microsecond=0)
        first = self.success("now")
        end = dt.datetime.now(dt.timezone.utc).replace(microsecond=0)
        actual = dt.datetime.strptime(first["timestamp"], "%Y-%m-%d %H:%M:%SZ").replace(tzinfo=dt.timezone.utc)
        self.assertTrue(start <= actual <= end)
        before = self.path.read_bytes()
        second = self.success("captured", "--timestamp", "2026-01-01 09:00:00Z")
        self.assertEqual((first["event_id"], second["event_id"]), ("LE001", "LE002"))
        self.assertTrue(self.path.read_bytes().startswith(before))
        self.assertEqual(second["timestamp"], "2026-01-01 09:00:00Z")

    def test_observed_and_historical(self):
        self.success("observed", "--timestamp", "2026-01-01 09:00:00Z", event="Received remote result; occurrence unknown.")
        self.success("historical", "--timestamp", "unknown", "--reason", "missing prior trace")
        self.success("historical", "--timestamp", "2026-01-01", "--reason", "only date available")
        data = self.path.read_text()
        self.assertIn("Observed: Received remote result", data)
        self.assertIn("| unknown |", data)
        self.assertIn("timing note: missing prior trace", data)
        self.assertIn("| 2026-01-01 |", data)

    def test_reject_invalid(self):
        self.reject("historical", "--timestamp", "unknown")
        self.reject("captured", "--timestamp", "2026-02-30 00:00:00Z")
        self.reject("captured")
        self.reject("now", "--timestamp", "2026-01-01 09:00:00Z")
        self.reject("observed", "--timestamp", "unknown", "--reason", "unknown")
        self.reject("now", event="first\n- LE999 | fake | fake")
        self.reject("now", event="first\u2028second")

    def test_ascii_timestamp_format(self):
        # strptime accepts some Unicode digits; ledger timestamps are canonical ASCII.
        for timestamp in ("２０２６-01-01 09:00:00Z", "2026-01-01 0١:00:00Z",
                          "2026-01-01 09:0١:00Z", "2026-01-01 09:00:0١Z"):
            with self.subTest(timestamp=timestamp):
                self.reject("captured", "--timestamp", timestamp)
        self.reject("historical", "--timestamp", "２０２６", "--reason", "year only")
        self.path.write_bytes(HEADER + "- LE001 | 2026-01-01 09:00:0١Z | old\n".encode("utf-8"))
        self.reject("now")

    def test_format_and_duplicates(self):
        self.path.write_bytes(HEADER + b"- LE001 | unknown | old\n- LE001 | unknown | duplicate\n")
        self.reject("now")
        self.path.write_bytes(HEADER + b"## Another heading\n")
        self.reject("now")
        self.path.write_bytes(b"# Ledger\n- LE042 | unknown | old\n## Events\n")
        self.reject("now")
        self.path.write_bytes(b"# Ledger\n")
        self.reject("now")

    def test_crlf_and_growth(self):
        before = (HEADER + b"- LE999 | unknown | old; timing note: legacy trace unavailable.\n").replace(b"\n", b"\r\n")
        self.path.write_bytes(before)
        result = self.success("now")
        self.assertEqual(result["event_id"], "LE1000")
        self.assertTrue(self.path.read_bytes().startswith(before + b"- LE1000"))
        self.assertTrue(self.path.read_bytes().endswith(b"\r\n"))

    def test_unterminated_and_invalid_history(self):
        for row in (b"- LE001 | 2026-01-01 09:00:00Z | truncated",
                    b"- LE001 | nonsense | old\n",
                    b"- LE001 | 2026-02-30 00:00:00Z | old\n",
                    b"- LE001 | unknown |    \n",
                    b"- LE001 | unknown | first\n- LE003 | unknown | gap\n",
                    b"- LE001 | unknown | old\rbroken\n"):
            with self.subTest(row=row):
                self.path.write_bytes(HEADER + row)
                self.reject("now")

    def test_noncanonical_containers_and_utf8(self):
        for prefix in (b"# Ledger\n```markdown\n", b"# Ledger\n~~~\n",
                       b"# Ledger\n<!--\n", b"# Ledger\n<div>\n"):
            with self.subTest(prefix=prefix):
                self.path.write_bytes(prefix + b"## Events\n")
                self.reject("now")
        self.path.write_bytes(HEADER + b"\xff\n")
        self.reject("now")
        self.path.write_bytes(HEADER)
        event = "Überprüfung | evidence: 日本語; $literal"
        self.success("now", event=event)
        self.assertIn(event.encode("utf-8"), self.path.read_bytes())

    def test_adopted_history_and_retry_reconciliation(self):
        # The first active adoption event is manually allocated using archived history.
        first = HEADER + b"- LE042 | 2026-01-01 09:00:00Z | Adopted archived history.\n"
        self.path.write_bytes(first)
        result = self.success("observed", event="Received outcome; remote time unknown.")
        self.assertEqual(result["event_id"], "LE043")
        written = self.path.read_bytes()
        self.assertTrue(written.startswith(first))
        # A caller that loses the receipt reconciles the actual row instead of retrying.
        self.assertEqual(written.count(b"- LE043 |"), 1)
        self.assertEqual(self.success("historical", "--timestamp", "2026-01-01 09:02Z",
                                      "--reason", "minute precision only")["event_id"], "LE044")

    def test_replacement_and_fsync_failure(self):
        spec = importlib.util.spec_from_file_location("ledger_append", SCRIPT)
        helper = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(helper)
        original_read = Path.read_bytes
        backup = self.path.with_suffix(".old")
        def replace_before_check(path, *args, **kwargs):
            if path == self.path and not backup.exists():
                path.rename(backup)
                path.write_bytes(HEADER)
            return original_read(path, *args, **kwargs)
        # Replacement during pre-write readback must not report success.
        with mock.patch.object(Path, "read_bytes", replace_before_check):
            with self.assertRaises((OSError, ValueError)):
                helper.append(self.path, "event", "now")
        self.assertEqual(self.path.read_bytes(), HEADER)
        with mock.patch.object(helper.os, "fsync", side_effect=OSError("injected failure")):
            with self.assertRaises(OSError):
                helper.append(self.path, "event", "now")
        self.assertEqual(self.path.read_bytes().count(b"- LE001 |"), 1)

    def test_missing_file(self):
        self.path.unlink()
        self.reject("now")


if __name__ == "__main__":
    unittest.main()
