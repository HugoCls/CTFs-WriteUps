import numpy as np
from PIL import Image

def bytes_to_bits(data_bytes):
    bits = []
    for b in data_bytes:
        for i in reversed(range(8)):
            bits.append((b >> i) & 1)
    return bits

def bits_to_bytes(bits):
    bytes_out = bytearray()
    for i in range(0, len(bits), 8):
        byte = 0
        for j in range(8):
            if i + j < len(bits):
                byte = (byte << 1) | bits[i + j]
        bytes_out.append(byte)
    return bytes_out

def bits_to_image(bits, filename):
    # Trouve la taille carrée la plus proche
    length = len(bits)
    size = int(np.ceil(np.sqrt(length)))
    padded_bits = bits + [0] * (size * size - length)

    arr = np.array(padded_bits, dtype=np.uint8) * 255
    img = arr.reshape((size, size))
    img_pil = Image.fromarray(img, mode='L')
    img_pil.save(filename)
    print(f"Image sauvegardée: {filename}")

def xor_decrypt(payload_path, key_bits_path, output_path, img_before, img_after):
    # Lire la clé binaire (ex: '01010101...')
    with open(key_bits_path, 'r') as f:
        key_bits = f.read().strip()
    key_len = len(key_bits)

    # Lire le payload brut en bytes
    with open(payload_path, 'rb') as f:
        data = f.read()

    # Convertir les bytes en bits
    bits = bytes_to_bits(data)

    # Sauvegarder image avant déchiffrement
    bits_to_image(bits, img_before)

    # XOR bit à bit avec la clé (répétée)
    decrypted_bits = []
    for i, bit in enumerate(bits):
        key_bit = int(key_bits[i % key_len])
        decrypted_bits.append(bit ^ key_bit)

    # Sauvegarder image après déchiffrement
    bits_to_image(decrypted_bits, img_after)

    # Regrouper les bits par 8 pour reconstruire les bytes
    decrypted_bytes = bits_to_bytes(decrypted_bits)

    # Sauvegarder le fichier déchiffré
    with open(output_path, 'wb') as f:
        f.write(decrypted_bytes)

    print(f"Déchiffrement terminé, fichier sauvegardé sous {output_path}")

# Utilisation
xor_decrypt('payload.raw', 'xor_key_bits.txt', 'decrypted_payload.bin', 'payload_raw.png', 'decrypted_payload.png')
