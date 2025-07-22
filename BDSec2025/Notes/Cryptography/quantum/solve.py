import base64
import hashlib
import zlib

X = [0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476,
     0xC3D2E1F0, 0x76543210, 0xFEDCBA98, 0x89ABCDEF]

def G(a, b):
    d = a
    for i in range(b):
        if i % 4 == 0:
            d = hashlib.sha256(d).digest()
        elif i % 4 == 1:
            d = hashlib.blake2b(d, digest_size=32).digest()
        elif i % 4 == 2:
            d = hashlib.md5(d).digest() * 2
        else:
            d = hashlib.sha1(d).digest() + d[:12]
    return d

def rot_r(val, r_bits, max_bits=8):
    return ((val >> r_bits) | (val << (max_bits - r_bits))) & (2**max_bits - 1)

def H_inv(q, k):
    m = bytearray()
    for i, s in enumerate(q):
        # 1) XOR avec X[i]
        xval = X[i % len(X)] & 0xFF
        s ^= xval
        # 2) rotation droite 3 bits
        s = rot_r(s, 3)
        # 3) XOR avec k[i]
        s ^= k[i % len(k)]
        m.append(s)
    return bytes(m)

# Clé d'après le code : G(self.b, 5)
b_key = b"simple_seed_123"
key = G(b_key, 5)

# Décodage base64 du message chiffré donné
cipher_b64 = "FL6gWSgGl71j8RANN2yzz9XckwawQ8MXqE7IAOVygOclZiHgi161L7s="
cipher_bytes = base64.b64decode(cipher_b64)

# Inversion H
plaintext_after_H_inv = H_inv(cipher_bytes, key)

print("Après inversion de H :")
print(plaintext_after_H_inv)

# Le résultat est probablement compressé (dans le code on voit un zlib.compress), essayons une décompression
try:
    decompressed = zlib.decompress(plaintext_after_H_inv)
    print("Après décompression zlib :")
    print(decompressed)
except Exception as e:
    print("Décompression zlib impossible :", e)
