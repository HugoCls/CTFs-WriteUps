import hashlib
from datetime import datetime

ciphertext = "INNVC{rJXKrb_FFg_NFTx_FMHDWFmX!!}"

def hex_char_to_int(c):
    if c.isdigit():
        return int(c)
    return 10 + ord(c.lower()) - ord('a')

def decrypt_caesar_variable(ciphertext, key):
    plaintext = ""
    key_len = len(key)
    letter_pos = 0  # position uniquement pour lettres alphabétiques

    for c in ciphertext:
        if c in '{}_!':  # caractères à laisser tels quels
            plaintext += c
            continue

        if c.isalpha():
            shift = (hex_char_to_int(key[letter_pos % key_len]) + letter_pos) % 26

            if c.isupper():
                base = ord('A')
                decrypted = chr((ord(c) - base - shift) % 26 + base)
            else:
                base = ord('a')
                decrypted = chr((ord(c) - base - shift) % 26 + base)

            plaintext += decrypted
            letter_pos += 1  # on avance la position des lettres seulement
        else:
            # autres caractères non alpha (chiffres, ponctuation), on laisse
            plaintext += c

    return plaintext

# Essai sur toutes les secondes entre 0 et 59
for second in range(4):
    dt = datetime(2024, 3, 15, 14, 30, second)
    timestamp_str = f"{dt.year},{dt.month},{dt.day},{dt.hour},{dt.minute},{dt.second}"
    h = hashlib.md5()
    h.update(timestamp_str.encode())
    hash_hex = h.hexdigest()

    decrypted = decrypt_caesar_variable(ciphertext, hash_hex)

    if "bdsec" in decrypted.lower():
        print(f"\n✅ Flag probable trouvé avec timestamp = {timestamp_str} et clé = {hash_hex} :\n")
        print(decrypted)
        break
else:
    print("Pas de flag trouvé sur cette plage de secondes.")
