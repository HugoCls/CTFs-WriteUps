import hashlib
from datetime import datetime

def format_timestamp(ts):
    return f"{ts.year},{ts.month},{ts.day},{ts.hour},{ts.minute},{ts.second}"

def get_hash_shifts(ts, algo='md5'):
    ts_str = format_timestamp(ts)
    if algo == 'md5':
        digest = hashlib.md5(ts_str.encode()).hexdigest()
    elif algo == 'sha1':
        digest = hashlib.sha1(ts_str.encode()).hexdigest()
    elif algo == 'sha256':
        digest = hashlib.sha256(ts_str.encode()).hexdigest()
    else:
        raise ValueError("Unknown hash algorithm")
    return [int(c, 16) for c in digest]

def decrypt_char(c, shift):
    if c.isupper():
        base = ord('A')
        return chr((ord(c) - base - shift) % 26 + base)
    elif c.islower():
        base = ord('a')
        return chr((ord(c) - base - shift) % 26 + base)
    elif c.isdigit():
        base = ord('0')
        return chr((ord(c) - base - shift) % 10 + base)
    else:
        return c

def decrypt_message(ciphertext, ts, algo='md5', mode=0):
    content = ciphertext[ciphertext.find('{')+1 : ciphertext.find('}')]
    shifts = get_hash_shifts(ts, algo)
    decrypted = ""
    for i, c in enumerate(content):
        base_shift = shifts[i % len(shifts)]
        if mode == 0:
            shift = base_shift + i
        elif mode == 1:
            shift = (base_shift * i) % 16
        elif mode == 2:
            shift = (base_shift - i) % 16
        else:
            shift = base_shift
        decrypted += decrypt_char(c, shift)
    return decrypted

if __name__ == "__main__":
    ciphertext = "INNVC{rJXKrb_FFg_NFTx_FMHDWFmX!!}"
    base_date = datetime(2024, 3, 15, 14, 30)

    for algo in ['md5']:
        print(f"\nTesting algorithm: {algo}")
        for sec in range(5):
            ts = base_date.replace(second=sec)
            for mode in range(3):
                flag_candidate = decrypt_message(ciphertext, ts, algo, mode)
                print(f"Second {sec}, mode {mode}: BDSEC{{{flag_candidate}}}")
