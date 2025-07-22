import numpy as np
from scipy.io import wavfile

# Load reversed file
sr, data = wavfile.read('reversed.wav')
data = data.astype(np.float32) / np.max(np.abs(data))

# Paramètres d'extraction
start_time = 5.4   # début en secondes
end_time = 8.6     # fin en secondes
bit_duration = 0.2  # durée d'un bit en secondes

start_sample = int(start_time * sr)
end_sample = int(end_time * sr)
segment = data[start_sample:end_sample]

samples_per_bit = int(sr * bit_duration)
num_bits = int(len(segment) / samples_per_bit)

bits = []

for i in range(num_bits):
    chunk = segment[i*samples_per_bit:(i+1)*samples_per_bit]
    spectrum = np.fft.rfft(chunk)
    freqs = np.fft.rfftfreq(len(chunk), d=1/sr)
    peak_freq = freqs[np.argmax(np.abs(spectrum))]

    if 400 < peak_freq < 600:
        bits.append(0)
    elif 900 < peak_freq < 1100:
        bits.append(1)

# Affiche la clé en bits (0 et 1)
bits_str = ''.join(str(bit) for bit in bits)
print(f"XOR key bits: {bits_str}")

# Convertir les bits en bytes
key_bytes = []
for i in range(0, len(bits), 8):
    byte = 0
    for j in range(8):
        if i + j < len(bits):
            byte = (byte << 1) | bits[i + j]
    key_bytes.append(byte)

key = bytes(key_bytes)
print(f"XOR key bytes: {key}")

# Sauvegarder la clé bytes
with open('xor_key.bin', 'wb') as f:
    f.write(key)

# Sauvegarder la clé bits
with open('xor_key_bits.txt', 'w') as f:
    f.write(bits_str)
