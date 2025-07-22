values = [
    0x45534442,
    0x75427b43,
    0x465f7a7a,
    0x616d726f,
    0x654c5f74,
    0x345f6b61,
    0x7d3635,
]

flag = ""
for v in values:
    # convertit l'entier en bytes (4 octets), little endian
    b = v.to_bytes((v.bit_length() + 7) // 8, 'little')
    flag += b.decode('ascii')

print(flag)
