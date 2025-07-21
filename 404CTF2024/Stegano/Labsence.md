# L'absence
## Enoncé
> Hier, Francis n'était pas là à son épreuve de barres asymétriques, il nous a envoyé une lettre d'excuse. Malheureusement, la fin de sa lettre est illisible.

> Déchiffrez la fin de ses excuses.

Auteur: **@Crevette** & **@Ceriseuh**

## Source Code
lettre.txt
```
bonsoir, désolé pour le déranGement. je n'ai pas pu Y aller hier pour l'épreuve de barres asyMétriques. désolé si je N'ai pas été à lA hauteur de voS attenTes, je feraIs mieux aux épreuves publiQUes de dEmain. 


bises.
franciS vigenere.

ps :
Kl qsfwm, r'qc hm s'ynfefmmh wej rc peahxik xi eg lmgigg i uni voqevmmem fuv vkq srnk jcy psmryurnl yiyli hkppee ehv fuck ! Syuf ahkmi orw rmztuw kmsbijifq, w'aa xvvcr ha jq eelkwkpij. Rc hbiub : 404KJZ{RwBmxrzHtaBywVxybramqAlj}
```

## Analyse

Un message a été encodé apparemment en utilisant l'algorithme de Vigenere. Le message semble être en Français en se basant sur l'auteur.

ciphertext:
`Kl qsfwm, r'qc hm s'ynfefmmh wej rc peahxik xi eg lmgigg i uni voqevmmem fuv vkq srnk jcy psmryurnl yiyli hkppee ehv fuck ! Syuf ahkmi orw rmztuw kmsbijifq, w'aa xvvcr ha jq eelkwkpij. Rc hbiub : 404KJZ{RwBmxrzHtaBywVxybramqAlj}`

## Exploitation

On peut se rendre sur `dcode` et obtenir la solution directement mais j'ai opté pour une solution fait maison.

Méthodes utilisées: **Index of Coincidence** pour obtenir la longueur de la clé, **Chi Square** pour deviner la clé ensuite.

```Python
from index_of_coincidence import find_key_length
from frequency_analysis import Chi_square_approach
from vigenere import vigenere_to_text

ciphertext = "Kl qsfwm, r'qc hm s'ynfefmmh wej rc peahxik xi eg lmgigg i uni voqevmmem fuv vkq srnk jcy psmryurnl yiyli hkppee ehv fuck ! Syuf ahkmi orw rmztuw kmsbijifq, w'aa xvvcr ha jq eelkwkpij. Rc hbiub : 404KJZ{RwBmxrzHtaBywVxybramqAlj}"

ciphertext_ = [e for e in ciphertext if ord(e) in [lower_k for lower_k in range(97, 97+26)] + [upper_k for upper_k in range(65, 65+26)]]
```

Tout d'abord je sélectionne les caractères qui ont été influencés par l'algorithme de Vigenere.

En effet, les caractères non alphabétiques agissent essentiellement comme des "trous" dans le processus de chiffrement, et ne sont pas comptés dans la boucle de chiffrement de la clé.

Pour les méthodes suivantes utilisées, nous allons former des blocs qui ont supposément subi le même shift, et il ne faudra pas prendre en compte ceux qui n'en ont pas subi.

La méthode de l'Index de Coincidence repose sur le fait que la somme des fréquences au carré dans un texte reste la même si chaque caractère a subi le même shift. 

Je vous laisse vous informer [Ici](https://pages.mtu.edu/~shene/NSF-4/Tutorial/VIG/Vig-IOC-Len.html) pour en savoir plus.

```Python
# Index of Coincidence approach (based on letters percentage of apparition on english Language, ICenglish)
key_length = find_key_length(ciphertext=ciphertext_, max_key_len=30)
print(f"Guessed key_lenght(index of coincidence): {key_length}")
```

Ensuite nous utilisons l'approche des X² basée sur le calcul de la distance entre la fréquence de toutes les lettres dans un texte donné.

Je vous laisse vous informer [Ici](https://pages.mtu.edu/~shene/NSF-4/Tutorial/VIG/Vig-Recover.html) pour en savoir plus.

```Python
# Chi-square approach
decryptedtext, guessedkey = Chi_square_approach(ciphertext_, key_length)
print(f"Guessed key(Chi-square): {guessedkey}")
```

Enfin nous pouvons decipher le texte de la manière suivante, et reconstruire le texte initial avec les caractères non pris en compte:
```Python
deciphered_text = vigenere_to_text(ciphertext_, key=guessedkey, action="decrypt")

final_text = ""
j = 0

for i in range(len(ciphertext)):
    if ord(ciphertext[i]) not in [lower_k for lower_k in range(97, 97+26)] + [upper_k for upper_k in range(65, 65+26)]:
        final_text += ciphertext[i]
        j+=1
    else:
        final_text += deciphered_text[i-j]

print(final_text)
```

La clé déterminée par mon algorithme est `GYMNWSTIQUES` ce qui nous donne:

En efjet, j'ai du m'absinter car le drepeau de ma natmon a ete dissiqule par des gers qui voulaiert faire perdri mon pays ! Mais epres une longye recherche, j'ei enfin pu le ritrouver. Le vomci : 404CTF{NeVoledPasLesDrapeeuxSvp}

La vraie clée est `GYMNASTIQUES`, mais on devine: 

Flag: **404CTF{NeVolezPasLesDrapeauxSvp}**