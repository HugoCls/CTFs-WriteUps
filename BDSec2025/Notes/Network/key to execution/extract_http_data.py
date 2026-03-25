from scapy.all import rdpcap, TCP, Raw
from urllib.parse import unquote
import re

PCAP_FILE = "file-5.pcapng"
ATTACKER_IP = "192.168.1.9"

post_bodies = []
urls_with_params = set()

print("[+] Lecture du fichier PCAP : " + PCAP_FILE)
packets = rdpcap(PCAP_FILE)
print(f"[+] {len(packets)} paquets chargés")

# Regrouper les flux TCP par (IP source, IP dest, port source, port dest)
connections = {}
for pkt in packets:
    if pkt.haslayer(TCP) and pkt.haslayer(Raw):
        ip = pkt.payload
        tcp = pkt[TCP]
        key = (ip.src, ip.dst, tcp.sport, tcp.dport)
        if key not in connections:
            connections[key] = b""
        connections[key] += bytes(pkt[Raw].load)

print(f"[+] {len(connections)} connexions TCP avec payload analysées")

req_count = 0
for conn_key, stream in connections.items():
    src_ip, dst_ip, _, dst_port = conn_key
    if dst_port != 80 or src_ip != ATTACKER_IP:
        continue

    # Séparer en requêtes HTTP (simple découpage naïf)
    http_requests = stream.split(b"\r\n\r\n")
    for req in http_requests:
        try:
            decoded = req.decode(errors="ignore")

            # Vérifie si c'est une requête HTTP valide
            if decoded.startswith("GET") or decoded.startswith("POST"):
                lines = decoded.splitlines()
                request_line = lines[0]
                method, path, _ = request_line.split()

                # Extraire les URLs avec paramètres
                if "?" in path:
                    urls_with_params.add(path)

                # Si POST, essayer de récupérer le body
                if method == "POST":
                    # Le body suit \r\n\r\n
                    if b"\r\n\r\n" in req:
                        body = req.split(b"\r\n\r\n", 1)[1]
                        post_bodies.append(body.decode(errors="ignore").strip())

                req_count += 1

        except Exception as e:
            continue

print(f"[+] Analyse terminée. {req_count} requêtes HTTP traitées.")
print("[+] Sauvegarde des corps POST dans post_bodies.txt")
with open("post_bodies.txt", "w") as f:
    for body in post_bodies:
        f.write(body + "\n" + "-"*60 + "\n")

print("[+] Sauvegarde des URLs avec paramètres dans urls_with_params.txt")
with open("urls_with_params.txt", "w") as f:
    for url in sorted(urls_with_params):
        f.write(unquote(url) + "\n")

print("✅ Terminé : post_bodies.txt et urls_with_params.txt générés.")
