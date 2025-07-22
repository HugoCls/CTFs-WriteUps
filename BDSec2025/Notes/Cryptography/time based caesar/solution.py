#!/usr/bin/env python
import hashlib
import re
from datetime import datetime, timezone, timedelta

def decode(txt, ts):
    h = hashlib.md5(str(int(ts)).encode()).hexdigest()
    res = ""
    for i, c in enumerate(txt):
        if c.isalpha():
            v = (int(h[i % len(h)], 16) + i * 3) % 26
            if c.isupper():
                res += chr((ord(c) - v - ord('A')) % 26 + ord('A'))
            else:
                res += chr((ord(c) - v - ord('a')) % 26 + ord('a'))
        else:
            res += c
    return res

if __name__ == "__main__":
    enc = "INNVC{rJXKrb_FFg_NFTx_FMHDWFmX!!}"
    flag_pattern = re.compile(r"BDSEC\{.+\}")

    for offset in range(-12, 15):
        tz = timezone(timedelta(hours=offset))
        dt = datetime(2024, 3, 15, 14, 30, 0, tzinfo=tz)
        ts = dt.timestamp()
        cand = decode(enc, ts)

        if flag_pattern.match(cand):
            print(f"UTC{offset:+d}: {cand}")