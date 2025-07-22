import glob

# Dictionnaire simple de magic bytes connus
magic_dict = {
    b'\x89PNG\r\n\x1a\n': 'PNG image',
    b'\xff\xd8\xff': 'JPEG image',
    b'BM': 'BMP image',
    b'PK\x03\x04': 'ZIP archive',
    b'GIF87a': 'GIF image',
    b'GIF89a': 'GIF image',
    b'%PDF-': 'PDF document',
}

def identify_magic(data):
    for magic, fmt in magic_dict.items():
        if data.startswith(magic):
            return fmt
    return 'Unknown format'

files = glob.glob('extracted_image_offset_*.bin')

for filename in files:
    with open(filename, 'rb') as f:
        magic_bytes = f.read(8)  # lire les premiers 8 octets
    print(f"{filename}: {magic_bytes.hex()} -> {identify_magic(magic_bytes)}")
