mask = 0b0010010001000010
result = 0b0000010001000000

x = 0b0001111111111101

print(bin(result))
print(bin(mask & x))

with open('keys_part3.sh','w') as f:
    with open('dict.hcmask','w') as f2:
        for i in range(4096):
            x = bin(i)[2:].zfill(12)
            part3 = int(f"{x[0]}{x[1]}0{x[2]}{x[3]}1{x[4]}{x[5]}{x[6]}1{x[7]}{x[8]}{x[9]}{x[10]}0{x[11]}", 2)

            hex_part3 = hex(part3)[2:].zfill(4)

            f.write(f"echo 'trying {hex_part3}...'\nhashcat -a 3 -m 0 hashes.txt '5ccd0b10-951c-{hex_part3}-?h?h?h?h-?h?h?h?ha59e79cd' > /dev/null 2>&1\nif [ $? -eq 0 ]; then\n  echo 'found {hex_part3}'; exit\nfi\n")
            f2.write(f"5ccd0b10-951c-{hex_part3}-?h?h?h?h-bd37a59e79cd\n")
            
        