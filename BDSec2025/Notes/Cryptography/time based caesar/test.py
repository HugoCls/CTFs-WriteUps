import hashlib
from datetime import datetime

def format_timestamp(timestamp):
    return f"{timestamp.year},{timestamp.month},{timestamp.day},{timestamp.hour},{timestamp.minute},{timestamp.second}"

def generate_md5_key(timestamp, length):
    time_str = format_timestamp(timestamp)
    md5_hash = hashlib.md5(time_str.encode()).hexdigest()
    hex_shifts = [int(h, 16) for h in md5_hash]
    return (hex_shifts * ((length // len(hex_shifts)) + 1))[:length]

def decrypt_char(c, shift):
    if c.isupper():
        return chr((ord(c) - ord('A') - shift) % 26 + ord('A'))
    elif c.islower():
        return chr((ord(c) - ord('a') - shift) % 26 + ord('a'))
    elif c.isdigit():
        return chr((ord(c) - ord('0') - shift) % 10 + ord('0'))
    else:
        return c

def decrypt_message(encrypted_body, timestamp):
    key_stream = generate_md5_key(timestamp, len(encrypted_body))
    decrypted = ''
    for i, (c, k) in enumerate(zip(encrypted_body, key_stream)):
        shift = k + i
        decrypted += decrypt_char(c, shift)
    return decrypted

# Main
cipher = "INNVC{rJXKrb_FFg_NFTx_FMHDWFmX!!}"

for i in range(0,4):
    ts = datetime(2024, 3, 15, 14, 30, i)

    # Extract only the encrypted content inside braces
    body = cipher[cipher.find('{')+1:cipher.find('}')]
    decrypted_body = decrypt_message(body, ts)

    print("Decrypted Flag:", f"BDSEC{{{decrypted_body}}}")
