import subprocess
import os

# Clé XOR en bits (fichier)
KEY_BITS_FILE = 'xor_key_bits.txt'
# Fichier audio contenant le payload à extraire
INPUT_AUDIO = 'payload_block.wav'
# Dossier temporaire pour fichiers intermédiaires
TMP_DIR = 'tmp_lsb_bruteforce'
os.makedirs(TMP_DIR, exist_ok=True)

# Les signatures magiques d'images à tester
MAGIC_BYTES = {
    b'\x89PNG\r\n\x1a\n': 'PNG',
    b'\xff\xd8\xff': 'JPEG',
    b'GIF87a': 'GIF',
    b'GIF89a': 'GIF',
    b'BM': 'BMP',
    b'%PDF-': 'PDF',
    # ajoute si besoin d'autres formats
}

def read_key_bits():
    with open(KEY_BITS_FILE, 'r') as f:
        return f.read().strip()

def xor_decrypt(data_bytes, key_bits):
    key_len = len(key_bits)
    bits = []
    for byte in data_bytes:
        for i in reversed(range(8)):
            bits.append((byte >> i) & 1)
    decrypted_bits = []
    for i, bit in enumerate(bits):
        key_bit = int(key_bits[i % key_len])
        decrypted_bits.append(bit ^ key_bit)
    decrypted_bytes = bytearray()
    for i in range(0, len(decrypted_bits), 8):
        byte = 0
        for j in range(8):
            if i + j < len(decrypted_bits):
                byte = (byte << 1) | decrypted_bits[i + j]
        decrypted_bytes.append(byte)
    return decrypted_bytes

def is_valid_magic(data):
    for magic, fmt in MAGIC_BYTES.items():
        if data.startswith(magic):
            return True, fmt
    return False, None

def brute_force_lsb(min_b=27500, max_b=27562, step=1):
    key_bits = read_key_bits()
    for b_size in range(min_b, max_b+1, step):
        print(f"[+] Testing size -b={b_size}")
        payload_file = os.path.join(TMP_DIR, f'payload_{b_size}.raw')
        decrypted_file = os.path.join(TMP_DIR, f'decrypted_{b_size}.bin')

        # Extraction LSB avec wavsteg
        cmd = ['stegolsb', 'wavsteg', '-r', '-i', INPUT_AUDIO, '-o', payload_file, '-n', '1', '-b', str(b_size)]
        result = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        if result.returncode != 0:
            print(f"Erreur extraction LSB avec -b {b_size}: {result.stderr.decode()}")
            continue

        # Lire le payload extrait
        with open(payload_file, 'rb') as f:
            data = f.read()

        if not data:
            print(f"Pas de données extraites pour -b {b_size}")
            continue

        # Déchiffrement XOR
        decrypted = xor_decrypt(data, key_bits)

        # Vérification magic bytes
        valid, fmt = is_valid_magic(decrypted)
        if valid:
            print(f"[!] Fichier déchiffré valide détecté avec -b={b_size}, format: {fmt}")
            # Sauvegarde du fichier déchiffré
            with open(decrypted_file, 'wb') as f:
                f.write(decrypted)
            print(f"Fichier déchiffré sauvegardé sous: {decrypted_file}")
            break
    else:
        print("[-] Aucun fichier valide détecté dans la plage testée.")

if __name__ == '__main__':
    brute_force_lsb()
