import hashlib
from datetime import datetime, timedelta
import string

from Crypto.Cipher import AES, DES, DES3
from Crypto.Util.Padding import unpad

ciphertext = "INNVC{rJXKrb_FFg_NFTx_FMHDWFmX!!}"
cipher_bytes = ciphertext.encode()

def decrypt_caesar_variable(ciphertext, key, extra_shift=0):
    plaintext = ""
    key_len = len(key)
    key_pos = 0

    for c in ciphertext:
        if c in '{}_':
            plaintext += c
            continue

        key_chr = key[key_pos % key_len]

        if key_chr in string.digits:
            shift = int(key_chr)
        else:
            shift = ord(key_chr) % 256

        shift = (shift + extra_shift) % 256

        decrypted_ord = (ord(c) - shift) % 256
        plaintext += chr(decrypted_ord)

        key_pos += 1

    return plaintext


def decrypt_xor(ciphertext, key):
    plaintext = ""
    key_len = len(key)
    key_pos = 0

    for c in ciphertext:
        if c in '{}_':
            plaintext += c
            continue

        k = ord(key[key_pos % key_len]) % 256
        p = chr(ord(c) ^ k)
        plaintext += p
        key_pos += 1

    return plaintext


def decrypt_block(cipher_bytes, key_bytes, cipher_cls):
    # ECB mode
    try:
        cipher = cipher_cls.new(key_bytes, cipher_cls.MODE_ECB)
        decrypted = cipher.decrypt(cipher_bytes)
        try:
            decrypted = unpad(decrypted, cipher.block_size)
        except ValueError:
            pass  # sometimes it's not padded properly
        return decrypted.decode(errors='ignore')
    except Exception as e:
        return None


for tz_offset in range(-12, 15):  # fuseaux horaires
    print(f"\n🌍 Testing timezone UTC{tz_offset:+}")

    for algo in sorted(hashlib.algorithms_available):
        for second in range(6):  # secondes 0-2

            dt_utc = datetime(2024, 3, 15, 14, 30, second) - timedelta(hours=tz_offset)
            timestamp_str = f"{dt_utc.year},{dt_utc.month},{dt_utc.day},{dt_utc.hour},{dt_utc.minute},0{dt_utc.second}"

            try:
                h = hashlib.new(algo)
            except Exception:
                continue

            h.update(timestamp_str.encode())

            if algo.startswith("shake_"):
                hash_hex = h.hexdigest(64)
            else:
                hash_hex = h.hexdigest()

            hash_bytes = bytes.fromhex(hash_hex[:64])  # prendre 32 bytes max
            key_16 = hash_bytes[:16]
            key_8 = hash_bytes[:8]
            key_24 = (hash_bytes + hash_bytes)[:24]

            print(f"\n{timestamp_str} [{algo}] => {hash_hex[:32]}...:")

            # Caesar variable + décalages
            for extra_shift in range(10):
                decrypted_c = decrypt_caesar_variable(ciphertext, hash_hex, extra_shift)
                if "bdsec" in decrypted_c.lower():
                    print(f"✅ Caesar (shift {extra_shift}) => {decrypted_c}")
                    exit(0)

            # XOR
            decrypted_xor = decrypt_xor(ciphertext, hash_hex)
            if "bdsec" in decrypted_xor.lower():
                print(f"✅ XOR => {decrypted_xor}")
                exit(0)

            # AES
            decrypted_aes = decrypt_block(cipher_bytes, key_16, AES)
            if decrypted_aes and "bdsec" in decrypted_aes.lower():
                print(f"✅ AES => {decrypted_aes}")
                exit(0)

            # DES
            decrypted_des = decrypt_block(cipher_bytes, key_8, DES)
            if decrypted_des and "bdsec" in decrypted_des.lower():
                print(f"✅ DES => {decrypted_des}")
                exit(0)

            # 3DES
            decrypted_3des = decrypt_block(cipher_bytes, key_24, DES3)
            if decrypted_3des and "bdsec" in decrypted_3des.lower():
                print(f"✅ 3DES => {decrypted_3des}")
                exit(0)
