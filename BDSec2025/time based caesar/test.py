ciphertext_full = "INNVC{rJXKrb_FFg_NFTx_FMHDWFmX!!}"
xor_key = [11, 10, 29, 19, 0]

plaintext = []
for i, c in enumerate(ciphertext_full):
    plaintext.append(chr(ord(c) ^ xor_key[i % len(xor_key)]))

decrypted = "".join(plaintext)
print("Message déchiffré complet :", decrypted)
