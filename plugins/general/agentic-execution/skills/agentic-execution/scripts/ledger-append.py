#!/usr/bin/env python3
"""Append one actual event to a compatible Task Ledger (Python 3.8+)."""
import argparse
import datetime as dt
import json
import os
from pathlib import Path
import re
import sys
import stat

ROW = re.compile(r"- (LE[0-9]{3,}) \| ([^|]+) \| (.+)")
ID_PREFIX = re.compile(r"\s*(?:[-*+]\s+|#+\s+|\|\s*)?LE[0-9]+(?:\s|\||:|$)")
FULL = "%Y-%m-%d %H:%M:%SZ"
PARTIAL = ((r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}Z", "%Y-%m-%d %H:%MZ"),
           (r"\d{4}-\d{2}-\d{2}", "%Y-%m-%d"),
           (r"\d{4}-\d{2}", "%Y-%m"), (r"\d{4}", "%Y"))


def precision(value):
    if value == "unknown":
        return "unknown"
    formats = ((r"\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}Z", FULL),) + PARTIAL
    for pattern, fmt in formats:
        if re.fullmatch(pattern, value, flags=re.ASCII):
            dt.datetime.strptime(value, fmt)
            return "full" if fmt == FULL else "partial"
    raise ValueError("invalid UTC timestamp or partial date")


def one_line(value, label):
    if not value or not value.strip() or any(ord(c) < 32 or ord(c) == 127 for c in value) or len(value.splitlines()) != 1:
        raise ValueError(label + " must be nonempty single-line text")
    return value.strip()


def next_id(data):
    # A complete helper-written row always ends in LF (including CRLF).
    # An unterminated tail might be a partial append, even if it parses.
    if not data.endswith(b"\n"):
        raise ValueError("unterminated ledger tail; reconcile manually")
    lines = data.decode("utf-8").replace("\r\n", "\n").split("\n")
    if any("\r" in line for line in lines):
        raise ValueError("unsupported bare CR; reconcile manually")
    if lines.count("## Events") != 1:
        raise ValueError("expected one canonical ## Events section at end of ledger")
    start = lines.index("## Events")
    # The compatible preamble is plain Markdown, not a document container.
    # Do not mistake a heading in a fenced example or raw HTML for history.
    if any(re.match(r"^\s*(?:`{3,}|~{3,}|<)", line) or "<!--" in line
           for line in lines[:start]):
        raise ValueError("unsupported fenced or HTML preamble; reconcile manually")
    if any(ID_PREFIX.match(line) for line in lines[:start]):
        raise ValueError("possible event outside canonical history; reconcile manually")
    last = 0
    for line in lines[start + 1:]:
        if not line.strip():
            continue
        m = ROW.fullmatch(line)
        if not m:
            raise ValueError("noncanonical history row; reconcile manually")
        precision(m[2])
        one_line(m[3], "historical event")
        n = int(m[1][2:])
        if n <= last or m[1] != f"LE{n:03d}":
            raise ValueError("nonmonotonic, duplicate or invalid event identity")
        if last and n != last + 1:
            raise ValueError("gap in active event history; reconcile manually")
        last = n
    return f"LE{last + 1:03d}"


def append(path, event, kind, timestamp=None, reason=None):
    if kind not in ("now", "captured", "observed", "historical"):
        raise ValueError("unsupported timing mode")
    event = one_line(event, "event")
    if reason is not None:
        reason = one_line(reason, "reason")
    if kind == "now" and timestamp is not None:
        raise ValueError("now must not receive a timestamp; use captured or historical")
    if kind in ("captured", "historical") and timestamp is None:
        raise ValueError("captured/historical requires an explicit timestamp")
    if timestamp is not None:
        accuracy = precision(timestamp)
        if accuracy != "full" and (kind != "historical" or not reason):
            raise ValueError("partial/unknown requires historical mode and a reason")
    if kind == "observed":
        event = "Observed: " + event
    if reason:
        event += "; timing note: " + reason
    # No creation, truncation or replacement. The caller owns authorization and
    # single-writer coordination; detect conflicting changes, never retry blindly.
    if not stat.S_ISREG(path.stat().st_mode):
        raise ValueError("ledger must be a regular file")
    flags = os.O_RDWR | os.O_APPEND | getattr(os, "O_BINARY", 0)
    with os.fdopen(os.open(path, flags), "r+b", buffering=0) as f:
        opened = os.fstat(f.fileno())
        if not stat.S_ISREG(opened.st_mode):
            raise ValueError("ledger must be a regular file")
        before = f.read()
        identity = next_id(before)
        if not os.path.samestat(opened, path.stat()) or path.read_bytes() != before:
            raise ValueError("ledger changed before append; reconcile")
        if timestamp is None:
            timestamp = dt.datetime.now(dt.timezone.utc).strftime(FULL)
        nl = b"\r\n" if b"\r\n" in before and b"\n" not in before.replace(b"\r\n", b"") else b"\n"
        suffix = f"- {identity} | {timestamp} | {event}".encode("utf-8") + nl
        if f.write(suffix) != len(suffix):
            raise OSError("partial append")
        os.fsync(f.fileno())
        if not os.path.samestat(opened, path.stat()) or path.read_bytes() != before + suffix:
            raise OSError("append readback mismatch or file replacement")
    return {"status": "appended", "event_id": identity, "timestamp": timestamp, "time_kind": kind}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("ledger", type=Path)
    parser.add_argument("--event", required=True, help="single-line actual event, including scope and evidence as applicable")
    parser.add_argument("--time-kind", choices=("now", "captured", "observed", "historical"), required=True)
    parser.add_argument("--timestamp", help="full UTC; historical may use partial precision or unknown")
    parser.add_argument("--reason", help="required for partial/unknown historical time")
    args = parser.parse_args()
    try:
        result = append(args.ledger, args.event, args.time_kind, args.timestamp, args.reason)
    except (OSError, ValueError) as exc:
        print(f"Ledger append failed: {exc}. Inspect actual history before retrying or falling back.", file=sys.stderr)
        return 1
    print(json.dumps(result))
    return 0


if __name__ == "__main__":
    sys.exit(main())
