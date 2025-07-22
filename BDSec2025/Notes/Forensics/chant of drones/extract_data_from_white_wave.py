import wave

# Charger la clé XOR binaire
with open('xor_key_bits_2.txt', 'r') as f:
    xor_key_bits = f.read().strip()

# Charger le fichier WAV
wav = wave.open('payload_block_detected.wav', 'rb')
n_frames = wav.getnframes()
frames = wav.readframes(n_frames)
wav.close()

bits = []
for i in range(0, len(frames), 2):
    # Construire l'entier signé 16 bits à partir de 2 octets (little endian)
    sample = frames[i] | (frames[i+1] << 8)
    # Convertir en signed 16-bit int
    if sample >= 0x8000:
        sample -= 0x10000
    lsb = sample & 1
    bits.append(str(lsb))

bits_str = ''.join(bits)
key_len = len(xor_key_bits)

for offset in range(8):
    decoded_bits = []
    for i, bit in enumerate(bits_str):
        key_bit = xor_key_bits[(i + offset) % key_len]
        decoded_bit = int(bit) ^ int(key_bit)
        decoded_bits.append(str(decoded_bit))

    # Convertir bits en bytes
    byte_array = bytearray()
    for i in range(0, len(decoded_bits), 8):
        byte_str = ''.join(decoded_bits[i:i+8])
        if len(byte_str) < 8:
            break
        byte_val = int(byte_str, 2)
        byte_array.append(byte_val)

    filename = f'extracted_image_offset_{offset}.bin'
    with open(filename, 'wb') as f:
        f.write(byte_array)
    print(f'Fichier généré : {filename}')
