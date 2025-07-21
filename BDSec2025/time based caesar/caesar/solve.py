import hashlib

def generate_key(timestamp_str, algo="md5"):
    if algo == "md5":
        return hashlib.md5(timestamp_str.encode()).hexdigest()
    elif algo == "sha1":
        return hashlib.sha1(timestamp_str.encode()).hexdigest()
    elif algo == "sha256":
        return hashlib.sha256(timestamp_str.encode()).hexdigest()
    else:
        raise ValueError("Unknown algo")

def decrypt(ciphertext, key_hex):
    plaintext = ""
    key_len = len(key_hex)
    
    for i, c in enumerate(ciphertext):
        key_char = key_hex[i % key_len]
        key_val = int(key_char, 16)  # valeur hex du caractère clé

        if c.isalpha():
            base = ord('A') if c.isupper() else ord('a')
            offset = ord(c) - base
            shift = (key_val + i) % 26
            new_char = chr(base + (offset - shift) % 26)
            plaintext += new_char
        elif c.isdigit():
            offset = int(c, 16)
            shift = (key_val + i) % 16
            new_char = hex((offset - shift) % 16)[2:]
            plaintext += new_char
        else:
            plaintext += c
    return plaintext

# timestamp from logs
# try different hash algos
for algo in ["md5", "sha1", "sha256"]:
    
    timestamps = [
        "20000313172000",
        "20240315143000",
        "20240315143001",
        "20240315143002",
        "20240315143003"
    ]

    for timestamp in timestamps:
        key = generate_key(timestamp, algo)
        result = decrypt("INNVC{rJXKrb_FFg_NFTx_FMHDWFmX!!}", key)
        print(f"Using {algo} key: {key}")
        print("Decrypted message:", result)
        print("-------------")
