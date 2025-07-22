import socket

HOST = '45.33.118.86'
PORT = 9994

def test_size(size, payload='A'):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((HOST, PORT))
        data = s.recv(1024).decode()  # message d'accueil
        print(data.strip())

        s.sendall(f"{size}\n".encode())  # envoi de la taille
        data = s.recv(1024).decode()
        print(data.strip())

        # Si le programme attend un payload, on l'envoie
        if "Too big" not in data:
            s.sendall((payload * int(size) + '\n').encode())
            data = s.recv(1024).decode()
            print(data.strip())

if __name__ == "__main__":
    # Exemple : test taille 1, 10, 50, 100
    for size in [1, 10, 50, 100, 200, 300]:
        print(f"Testing size = {size}")
        test_size(size)
        print("-" * 40)
