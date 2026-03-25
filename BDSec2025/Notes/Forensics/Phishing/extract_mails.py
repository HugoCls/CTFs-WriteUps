import os
import re
import subprocess

RAW_IMAGE = "disk.raw"
OFFSET = 128
INPUT_LIST = "eml_list.txt"
OUTPUT_DIR = "emails"

def clean_filename(name):
    return name.replace('/', '_').strip()

def extract_eml_files():
    if not os.path.exists(OUTPUT_DIR):
        os.makedirs(OUTPUT_DIR)

    pattern = re.compile(r'^\+\+ r/r (\d+)-\d+-\d+:\s*(.+)$')

    with open(INPUT_LIST, 'r') as f:
        for line in f:
            line = line.strip()
            m = pattern.match(line)
            if m:
                inode = m.group(1)
                filename = clean_filename(m.group(2))
                output_path = os.path.join(OUTPUT_DIR, filename)

                mode = 'ab' if os.path.exists(output_path) else 'wb'
                action = "Appending to" if mode == 'ab' else "Creating"

                print(f"{action} {output_path} from inode {inode}")

                try:
                    with open(output_path, mode) as out:
                        subprocess.run(['icat', '-o', str(OFFSET), RAW_IMAGE, inode], stdout=out, check=True)
                except subprocess.CalledProcessError as e:
                    print(f"❌ Error extracting inode {inode}: {e}")
            else:
                print(f"⚠️ Ignored line (bad format): {line}")

if __name__ == "__main__":
    extract_eml_files()
