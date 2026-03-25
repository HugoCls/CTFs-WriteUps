import hashlib

def detect_hash_algorithm(hash_string):
    hash_length = len(hash_string)
    algorithms = {
        32: "MD5",
        40: "SHA1",
        64: "SHA256"
    }

    algorithm = algorithms.get(hash_length)
    if algorithm:
        return algorithm
    else:
        return "Algorithme de hachage inconnu"

hash_string = "84e343a0486ff05530df6c705c8bb4"

algorithm = detect_hash_algorithm(hash_string)
print("L'algorithme de hachage semble être :", algorithm)