# Not on my watch
## Enoncé
> Vous êtes arbitre pour l'épreuve de ski de fond et vous accordez une attention particulière à tout ce qui touche au temps.

> Cependant, en vous réveillant le matin de la compétition, vous vous rendez compte que votre belle montre de poche s'est arrêtée pendant la nuit. Vous la démontez et vous rendez compte que le mécanisme a l'air endommagé.

> Sous le coup de la déception, vous entreprenez de trouver un nouveau mécanisme pour celle-ci. Vous vous renseignez donc sur le nombre de mécanismes qui ont été produits.

> Si 1,000,387 mécanismes ont été produits, le format du flag sera:

> **Format du flag:** 404CTF{1,000,387}

Auteur: **@HgAt**

## Analyse de la photo
pocket_watch.png
<p>
    <img src="../../_Platforms/images/404CTFOSINT2.png" alt="img1" style="width:50%;">
</p>

Nous remarquons une montre:
- Délivrée par A.W.W.CO
- Marque Waltham
- 15 Jewels
- Numéro de série: 15404141

## Recherche du site constructeur

A force de recherches à coup de Google Dorks `intext:"waltham" intext:"15 jewels"` etc. nous apprenons qu'il existe un site appelé **pocketwatchdatabase**.

Sur ce site nous pouvons rechercher des données sur une montre en fonction de son numéro de série, et en loccurence nous en avons un.

Avec une recherche appropriée nous trouvons la [page](https://pocketwatchdatabase.com/search/result/waltham/15404141) correspondante à notre montre.

Et nous récupérons la donnée: Grade/Model Total Production:	197,100

Flag: **404CTF{197,100}**