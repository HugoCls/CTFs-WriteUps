import os
import re
import pandas as pd
from collections import Counter

# Chemin vers le dossier contenant les .eml
EMAILS_DIR = "emails"

# Regex pour extraire les adresses e-mail
EMAIL_REGEX = re.compile(r"[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}")

# Initialiser un compteur
email_counter = Counter()

# Parcourir tous les fichiers .eml du dossier
for root, _, files in os.walk(EMAILS_DIR):
    for file in files:
        if file.lower().endswith(".eml"):
            file_path = os.path.join(root, file)
            try:
                with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
                    content = f.read()
                    matches = EMAIL_REGEX.findall(content)
                    email_counter.update(matches)
            except Exception as e:
                print(f"Erreur avec {file_path} : {e}")

# Convertir en DataFrame
df = pd.DataFrame(email_counter.items(), columns=["Email", "Occurrences"])
df = df.sort_values(by="Occurrences", ascending=False).reset_index(drop=True)

# Afficher le DataFrame
print(df)
