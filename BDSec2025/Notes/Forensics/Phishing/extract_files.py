import re
import os

input_list = "img_files.txt"
output_script = "download_files.sh"
image_offset = 128  # offset secteur à adapter si besoin
image_file = "disk.raw"  # nom de ton image disque

pattern = re.compile(r'r/r (\d+)-128-\d+: *(.+)')

with open(input_list, 'r') as f:
    lines = f.readlines()

with open(output_script, 'w') as out:
    out.write("#!/bin/bash\n\n")
    out.write("mkdir -p files\n\n")
    for line in lines:
        m = pattern.search(line)
        if m:
            inode = m.group(1)
            filename = m.group(2).strip()
            safe_name = filename.replace(' ', '_').replace('/', '_')  # sécurité noms
            out.write(f"icat -o {image_offset} {image_file} {inode} > files/{safe_name}\n")

os.chmod(output_script, 0o755)
print(f"Script bash généré : {output_script}")
