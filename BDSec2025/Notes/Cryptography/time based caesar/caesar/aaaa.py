import hashlib
from datetime import datetime, timedelta
import string

ciphertext = "INNVC{rJXKrb_FFg_NFTx_FMHDWFmX!!}"

def decode(txt: str, ts):
    h = hashlib.md5(str(int(ts)).encode()).hexdigest()
    res = ""
    for i, c in enumerate(txt):
        if c.isalpha():
            v = (int(h[i % len(h)], 16) + i * 3) % 26

            if c.isupper():
                res += chr((ord(c) - ord('A') - v) % 26 + ord('A'))
            else:
                res += chr((ord(c) - ord('a') - v) % 26 + ord('a'))
        else:
            res += c
    return res


# UTC timestamp variations (based on timezone shifts)
for tz_offset in range(-12, 15):
    dt_utc = datetime(2024, 3, 15, 14, 30, 0) - timedelta(hours=tz_offset)
    ts = dt_utc.timestamp()
    
    decrypted = decode(ciphertext, ts)

    print(decrypted)
    if "bdsec" in decrypted.lower():
        print(f"✅ Decrypted => {decrypted}")
        break
