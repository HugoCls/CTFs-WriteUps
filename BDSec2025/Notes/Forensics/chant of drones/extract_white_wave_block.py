import numpy as np
from scipy.io import wavfile
import sys

filename = 'chant_of_the_drones.wav'
start_time = 26       # où commencer la recherche en secondes
threshold = 0.001      # seuil d'amplitude à ajuster

# Chargement
sr, data = wavfile.read(filename)
if data.ndim > 1:
    data = data[:,0]  # canal mono

data = data.astype(np.float32)
data /= np.max(np.abs(data))  # normalisation

start_sample = int(sr * start_time)
end_sample = len(data)

# Cherche le premier son > seuil à partir de start_sample
detected_sample = None
for i in range(start_sample, end_sample):
    if abs(data[i]) > threshold:
        detected_sample = i
        break

if detected_sample is None:
    print("Aucun son détecté au-delà du seuil à partir de", start_time, "s")
    sys.exit(1)

print(f"Sons détecté à {detected_sample/sr:.3f} secondes (échantillon {detected_sample})")

# Extraction depuis detected_sample jusqu'à la fin
extracted = data[detected_sample:]

# Sauvegarde
from scipy.io.wavfile import write
write('payload_block_detected.wav', sr, (extracted * 32767).astype(np.int16))
print(f"Bloc extrait sauvegardé dans payload_block_detected.wav (durée {len(extracted)/sr:.2f}s)")
