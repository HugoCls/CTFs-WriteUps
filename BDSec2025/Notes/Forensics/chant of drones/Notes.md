# Notes

Plan:
- Analyser le fichier audio chant_of_the_drones.wav (ex. avec soxi ou ffprobe) pour comprendre ses caractéristiques (durée, fréquence d’échantillonnage).
- Reverser l’audio (ex. sox chant_of_the_drones.wav reversed.wav reverse) pour faire ressortir les motifs cachés.
- Analyser le spectrogramme de reversed.wav (ex. Audacity) pour détecter les tons alternants à 500Hz (bit 0) et 1000Hz (bit 1).

Les pics de fréquence entre 500Hz et 1000Hz sont entre 5.4s et 8.6s et durent 0.2s (quasiment).

- Extraire la séquence binaire à partir des fréquences détectées (ex. script Python avec FFT pour convertir fréquences en bits).

get_key... .py

- Assembler les bits en bytes pour récupérer la clé XOR.

xor_key_bits.txt

- Localiser la zone du fichier contenant le payload caché (probablement dans la fin ou un segment spécifique, ex. trim avec sox).

extract_block.py

- Extraire le payload caché via LSB steganography (ex. stegolsb wavsteg -r -i payload_block.wav -o payload.raw -n 1 -b 32).

32 bytes d'après le fichier fourni avec le .wav

- Déchiffrer le payload extrait en appliquant la clé XOR découverte.

.... ????



```bash
soxi chant_of_the_drones.wav

Input File     : 'chant_of_the_drones.wav'
Channels       : 1
Sample Rate    : 44100
Precision      : 16-bit
Duration       : 00:00:31.09 = 1371008 samples = 2331.65 CDDA sectors
File Size      : 2.74M
Bit Rate       : 706k
Sample Encoding: 16-bit Signed Integer PCM

sox chant_of_the_drones.wav payload_block.wav trim 26

sox chant_of_the_drones.wav reversed.wav reverse
``` 

Ouvre reversed.wav dans Audacity → Analyse → Spectrogramme.
Tu devrais voir des alternances de tons à 500Hz et 1000Hz. Chaque bit est représenté par une courte durée à 500Hz (0) ou 1000Hz (1).

```python
import numpy as np
from scipy.io import wavfile

# Load reversed file
sr, data = wavfile.read('reversed.wav')
data = data.astype(np.float32) / np.max(np.abs(data))

# paramètres
bit_duration = 0.1 # à ajuster si nécessaire
samples_per_bit = int(sr * bit_duration)
num_bits = int(len(data) / samples_per_bit)

bits = []

for i in range(num_bits):
    chunk = data[i*samples_per_bit:(i+1)*samples_per_bit]
    spectrum = np.fft.rfft(chunk)
    freqs = np.fft.rfftfreq(len(chunk), d=1/sr)
    peak_freq = freqs[np.argmax(np.abs(spectrum))]

    if 400 < peak_freq < 600:
        bits.append(0)
    elif 900 < peak_freq < 1100:
        bits.append(1)

# convertir en bytes
key_bytes = []
for i in range(0, len(bits), 8):
    byte = 0
    for j in range(8):
        if i+j < len(bits):
            byte = (byte << 1) | bits[i+j]
    key_bytes.append(byte)

key = bytes(key_bytes)
print(f"XOR key: {key}")
```

## Connaître la durée et la fréquence d’échantillonnage

Exemple : si ton segment payload_block_detected.wav fait 5 secondes, et que le fichier est en 44,1 kHz, mono, 16 bits :

    Nombre d’échantillons = 44100 × 5 = 220,500

    Si tu extraits sur 1 bit LSB par échantillon → max bits = 220,500 bits ≈ 27,562 bytes (220,500 ÷ 8)
44100 × 5 / 8 bits
```bash
stegolsb wavsteg -r -i payload_block_detected.wav -o payload.raw -n 1 -b 32

Files read                     in 0.00s
Recovered 27562 bytes          in 0.00s
Written output file            in 0.00s
(env) ➜  chant of drones xxd -p payload.raw | tr -d '\n' > payload.hex

python3 decrypt.py

Déchiffrement terminé, fichier sauvegardé sous decrypted_payload.bin
```