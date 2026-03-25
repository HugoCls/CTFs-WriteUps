def hex_to_ascii(hex_str):
    try:
        return bytes.fromhex(hex_str).decode('utf-8', errors='replace')
    except Exception as e:
        return f"[Erreur décodage] {e}"

input_file = "http_bodies_non_nuls.txt"  # fichier contenant les hex
output_file = "post_bodies_ascii.txt"

with open(input_file, 'r') as f_in, open(output_file, 'w') as f_out:
    for line_num, line in enumerate(f_in, 1):
        hex_str = line.strip()
        if not hex_str:
            continue
        ascii_str = hex_to_ascii(hex_str)
        f_out.write(f"--- Corps #{line_num} ---\n")
        f_out.write(ascii_str + "\n\n")

print(f"Décodage terminé. Résultats dans {output_file}")
