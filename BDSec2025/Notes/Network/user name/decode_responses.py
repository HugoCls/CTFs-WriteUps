import base64
import gzip
import io
import re

data_base64 = """
SFRUUC8xLjEgMjAwIE9LDQpEYXRlOiBTYXQsIDE5IEp1bCAyMDI1IDE5OjUyOjAyIEdNVA0KU2Vy
dmVyOiBBcGFjaGUvMi40LjYyIChEZWJpYW4pDQpYLVBvd2VyZWQtQnk6IFBIUC84LjEuMzMNClZh
cnk6IEFjY2VwdC1FbmNvZGluZw0KQ29udGVudC1FbmNvZGluZzogZ3ppcA0KQ29udGVudC1MZW5n
dGg6IDEwMzcNCktlZXAtQWxpdmU6IHRpbWVvdXQ9NSwgbWF4PTEwMA0KQ29ubmVjdGlvbjogS2Vl
cC1BbGl2ZQ0KQ29udGVudC1UeXBlOiB0ZXh0L2h0bWw7IGNoYXJzZXQ9VVRGLTgNCg0KH4sIAAAA
AAAAA5VUXW+bSBR9bn+FF2mlrRQUWMVV120ijY2pEhtSCh4IbxgmmGUCCMaGZJv/vncG7CSOcdKH
0Qwz595z7he26ruOZY5RnWoTy5xj6puo8bf7cqGHrquuZgvHjFy9WWAaapZlXKI61jy8CrHue4Az
7LRybcosXBuuMy3meloIW6z6GNOhhR9M/s1t56iuNFcde51/TU+bmd34M36n08jF2Cdw/2Cn4xlS
ptokNmAvkB0broebHy/4Gt/DFLseHXsGYLCacw4T1V8MDeUm6u70TpvgSMXdg0dXC28q8Abgr5A6
vMF6M9v637736cP6yuP6tNq4nNTmwhWx/HMD2MDVi5/e2O/ueuwXKee+RvWZxs+d7czGvot/+tjG
yjFuC4u6TTVkce4xBt0/3Gnltm+9dfC86VDkFSEDITUKnTTf524xvXluDDcV2i8nYpmGoxdXW347
pS6mC+BvArtfx5Wt+mML8RjimVgKneNUR2/1hZMOr3VdvXFwzDXMeH9MYvPaSc8W0JOmi4BTXQHn
8NqJ+/sRamQ7UxHHTBPr6a7LR/dN+3OhYstOFeEDiWUqvBYLPSLfPfHmR9Anrj4M7brTRVubvvgW
Uxa0fY/E4t8e5NFWGsCN5y7tt/Xp6qqdZ2W+mwHghbihpjrwqiFWjvSV6i8xVVHb17UxiZXdvnsT
8UehhcczBzee01tj4/zbH7I8qItRXObrYvCfVLF7SqQRHIogTLKYH4sgirojywtpJG2CclSUpCLs
Vwf79VmRTqRlzlh+dxgwVKTHx8cTiQb3+ZoJX/cFMElhnlWsDJKMRIAYyPLFx29RshmENKiqc6ku
5CXNw1QWCqWBEHi+1SSDoBGw/SXLAJRbTlnuSGX5s/Lp6xbaqjuGHiqfpIuPH/ZzEtAkzkBpnURE
OhBBRG6DNWVb9R/65Q+EK+EHcDuiKmFEpnmcD065g2cv+xJu15QeknBLSQP3fHPLgNeo5tuJ9O+6
Ysnt/STPGMnAQtSVyEvCakIyAGxIyZIwoIgz3LUYXuVtMG9GIyRx4E50mNP1XVZ19ocddJjWcM8S
4oUUsRUoURXlT2mr5KirXWfwHMjLoEqqkbC+eJFlljBKgICSDaHS6O/HXcr3ysGCmEJPts/i9RTI
n8k9fdL7ysOrON4ZQ4t4EsJrVYKbFUniFTs8WGd88rY8StE8o2q5ury0Po61/xkMi3A04m4GQZkE
8iqJIpKdS6xcE+mV7FYgpPgpN0/J6dS/M38vEHuAapfh9/yuhLTvQc+P6gv/D/3OBPUNyJuztZug
IyO01/9ZsEnigCU5750cmEGmQbI1+M6gYcsjo5+XCYgQtjzwTvQzEYdYZGjxlE9DsOTTIP0PWdqQ
LW4KAAA=
"""

def main():
    key = 57
    decoded = base64.b64decode(data_base64)

    # Séparer les headers et gzip (double CRLF)
    header_end = decoded.find(b"\r\n\r\n") + 4
    headers = decoded[:header_end]
    compressed_data = decoded[header_end:]

    print("Headers:\n", headers.decode())

    # Décompression gzip
    with gzip.GzipFile(fileobj=io.BytesIO(compressed_data)) as gz:
        decompressed = gz.read()

    decompressed_str = decompressed.decode(errors='replace')
    print("\nDecompressed content:\n", decompressed_str)

    # Extraction de la chaîne base64 chiffrée (pattern base64 typique, long, ici après "Decompressed content:" )
    # Regex : chercher la plus longue séquence base64 (caractères [A-Za-z0-9+/=]) >= 100 chars
    encrypted_b64_match = re.search(r'([A-Za-z0-9+/=]{100,})', decompressed_str)
    if not encrypted_b64_match:
        print("\nNo encrypted base64 string found.")
        return

    encrypted_b64 = encrypted_b64_match.group(1)
    print("\nEncrypted base64 extracted:\n", encrypted_b64[:100], "...")

    # Décodage base64
    encrypted_bytes = base64.b64decode(encrypted_b64)

    # XOR déchiffrement
    decrypted_bytes = bytes([b ^ key for b in encrypted_bytes])

    # Affichage résultat
    print("\nDecrypted content:\n")
    print(decrypted_bytes.decode('utf-8', errors='replace'))


if __name__ == "__main__":
    main()
