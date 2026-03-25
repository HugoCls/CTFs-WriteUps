mkdir -p emails

while read -r line; do
  # Exemple de ligne:
  # ++ r/r 103472-128-1:	email_25.eml
  
  # Extraire inode complet (troisième mot)
  inode_full=$(echo "$line" | awk '{print $3}' | cut -d':' -f1)
  
  # Ne garder que la partie avant le premier tiret
  inode=$(echo "$inode_full" | cut -d'-' -f1)
  
  # Extraire le nom du fichier (tout après ':', nettoyé)
  filename=$(echo "$line" | cut -d':' -f2 | sed 's/^\s*//g')
  
  # Nettoyer le nom : remplacer '/' par '_'
  cleanname=$(echo "$filename" | tr '/' '_')
  
  # Extraire le fichier
  icat -o 128 disk.raw "$inode" > "emails/$cleanname"
done < raw_eml_list.txt
