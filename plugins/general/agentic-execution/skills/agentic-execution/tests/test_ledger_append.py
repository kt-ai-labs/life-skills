import datetime as dt
import json
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
        before = (HEADER + b"- LE999 | unknown | old").replace(b"\n", b"\r\n")
        self.path.write_bytes(before)
        result = self.success("now")
        self.assertEqual(result["event_id"], "LE1000")
        self.assertTrue(self.path.read_bytes().startswith(before + b"\r\n- LE1000"))
        self.assertTrue(self.path.read_bytes().endswith(b"\r\n"))

    def test_missing_file(self):
        self.path.unlink()
        self.reject("now")


if __name__ == "__main__":
    unittest.main()
