# Bébé nageur
## Enoncé
> Vous ressortez de votre premier cours de natation et quelqu'un vous a laissé un petit mot dans votre casier. Vous suspectez votre rival que vous venez juste de battre à plate couture lors d'une course effrénée dans le bassin des bébés nageurs.

> Déchiffrez ce message.

Auteur: **@Little_endi4ane** & **@acmo0**

## Source Code
challenge.py
```Python
from flag import FLAG
import random as rd

charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789{}_-!"

def f(a,b,n,x):
	return (a*x+b)%n

def encrypt(message,a,b,n):
	encrypted = ""
	for char in message:
		x = charset.index(char)
		x = f(a,b,n,x)
		encrypted += charset[x]

	return encrypted

n = len(charset)
a = rd.randint(2,n-1)
b = rd.randint(1,n-1)

print(encrypt(FLAG,a,b,n))

# ENCRYPTED FLAG : -4-c57T5fUq9UdO0lOqiMqS4Hy0lqM4ekq-0vqwiNoqzUq5O9tyYoUq2_
```
## Analyse

L'encryption est effectuée en utilisant un modulo, chaque lettre est encodée en utilisant les mêmes paramètres a,b et n.

Nous connaissons n et a et b appartiennent à des ensembles finis, respectivement [2,n-1] et [1,n-1].

Le dénombrement de l'ensemble des combinaisons possibles est simple: #[2,n-1] * #[1,n-1] (#=cardinal) et est de l'odre de grandeur de n**2.

Pour chaque caractère, l'opération inverse serait respectivement 

## Exploitation

Si nous effectuons un brute-force sur l'ensemble des valeurs de a et b, nous obtenons le flag.

```Python
for a in range(2, n):
    for b in range(1, n):

        plaintext = encrypt("-4-c57T5fUq9UdO0lOqiMqS4Hy0lqM4ekq-0vqwiNoqzUq5O9tyYoUq2_",a,b,n)

        if "404CTF" in plaintext:
            print(plaintext)
```

Flag: **404CTF{Th3_r3vEnGE_1S_c0minG_S0oN_4nD_w1Ll_b3_TErRiBl3_!}**