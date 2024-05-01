# De la friture sur la ligne
## Enoncé

> Vous êtes parti ce matin pour une compétition de pêche au bord de la rivière près de chez vous. Malheureusement vous n'avez récupéré que de la friture sur votre ligne et vous êtes fait battre à plate couture. Dépité, sur le chemin du retour, vous tombez sur une étrange clé USB...

> Le but du challenge est de reconstituer le fichier nommé flag.png

Hint: Bit de parité

Auteur: **@acmo0**

## Source Code
challenge.py
```Python
import numpy as np

def encode_data(d):
	return list(d)+[sum([e for e in d])%2]

def encode_file(f):
	# Read a file and convert it to binary
	_bytes = np.fromfile(f, dtype = "uint8")
	bits = np.unpackbits(_bytes)
	output = []
	# Encode it for more data integrity safety ;)
	for i in range(0,len(bits),7):
		encoded = encode_data(bits[i:i+7])
		output += encoded.copy()
	return np.array(output,dtype="uint8")

def save_channel(data,channel):
	with open("channel_"+str(channel),"w+") as f:
		f.write(''.join(data.astype(str)))

def transmit(data):
	# Time to send it !
	# Separate each bits of each bytes 
	to_channel_1 = data[0::8]
	to_channel_2 = data[1::8]
	to_channel_3 = data[2::8]
	to_channel_4 = data[3::8]
	to_channel_5 = data[4::8]
	to_channel_6 = data[5::8]
	to_channel_7 = data[6::8]
	to_channel_8 = data[7::8]
	# Send it to good channel (I hope)
	from_channel_1 = good_channel(to_channel_1)
	from_channel_2 = good_channel(to_channel_2)
	from_channel_3 = good_channel(to_channel_3)
	from_channel_4 = bad_channel(to_channel_4)  # Oups :/
	from_channel_5 = good_channel(to_channel_5)
	from_channel_6 = good_channel(to_channel_6)
	from_channel_7 = good_channel(to_channel_7)
	from_channel_8 = good_channel(to_channel_8)
	# It's up to you now ;)
	save_channel(from_channel_1,1)
	save_channel(from_channel_2,2)
	save_channel(from_channel_3,3)
	save_channel(from_channel_4,4)
	save_channel(from_channel_5,5)
	save_channel(from_channel_6,6)
	save_channel(from_channel_7,7)
	save_channel(from_channel_8,8)

def good_channel(data):
	return data
def bad_channel(data):
	return (data+np.random.randint(low=0,high=2,size=data.size,dtype='uint8'))%2

flag = encode_file("flag.png")
transmit(flag)
```
Et les fichiers channel_1, .., channel_8

## Analyse

L'image initiale a été transformée en binaire, code binaire qu'on a découpé en octets comprenant un bit de parité chacun (le 8e)

Ensuite, le code binaire a été séparé en 8 channels différents correspondant chacun à la concaténation des ièmes bits de chaque octet. 

Donc le channel_8 correspond à la parité de chaque octet.

De plus on peut voit que seul le channel_4 a subi des modifications, chaque bit du channel_4 a eu une probabilité de flip de 50%. Ce qui signifie que nous ne pouvons croire les données de ce channel.

Les modifications ayant été faites après la signature, on peut alors vérifier l'intégrité des données en reconstituant chaque bit, et en regardant si la parité correspond à la parité signée.

## Reconstitution

On définit repair_octet qui prend un octet en str et renvoie cet octet dont le 4e bit a été corrigé si il y avait une erreur.

```Python
def repair_octet(octet: str):
    octet_list = list(octet)
    signature = int(octet[7])
    
    parity = sum([int(octet[i]) for i in range(7)]) % 2

    if parity != signature:
        octet_list[3] = str((int(octet_list[3]) + 1) % 2)

    return ''.join(octet_list)
```

Après avoir lu les 8 channels et les avoir mis dans des listes:
```Python
for i in range(channel_length):
    octet = to_channel_1[i] + to_channel_2[i] + to_channel_3[i] + to_channel_4[i] + to_channel_5[i] + to_channel_6[i] + to_channel_7[i] + to_channel_8[i]
    
    octet = repair_octet(octet)

    octets.append(octet)

flag_bytes = ''.join([str(bit) for bit in octets])

with open("flag_bytes", "w") as file:
    file.write(flag_bytes)
```

Ensuite j'ai utilisé le code suivant pour passer d'une séquence de bits en str à une image:
```Python
import numpy as np
from PIL import Image

def decode_data(d):
    # Decode encoded data / Remove signed bits
    return d[:-1]

def decode_file(encoded_data):
    # Decode encoded file data
    decoded_bits = []
    for i in range(0, len(encoded_data), 8):
        decoded_bits.extend(decode_data(encoded_data[i:i+8]))

    decoded_bits = np.array(decoded_bits, dtype=np.uint8)
    return np.packbits(decoded_bits)

def save_image(data, filename):
    # Save image from data
    with open(filename, "wb") as f:
        f.write(data)
        
def save_photo_from_binary(binary_filename, output_filename):
    # Load binary file
    with open(binary_filename, "r") as f:
        binary_data = np.array(list(map(int, f.read())), dtype=np.uint8)
    
    # Decode binary data
    decoded_data = decode_file(binary_data)
    
    # Save image
    save_image(decoded_data, output_filename)

binary_filename = "flag_bytes"
output_filename = "flag.png"
save_photo_from_binary(binary_filename, output_filename)
```

Et on obtient le flag au format .png!

Rq: Nous aurions pu totalement ignorer le channel_4 et le reconstruire entièrement au lieu de "réparer" ses bits, ce qui était inutile.

Flag: **404CTF{5feef3c530abba7ae2242487b25b6f6b}**