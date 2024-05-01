# Le tir aux logs
## Enoncé
> Il semblerait qu'une personne malveillante ait réussi à se connecter sur le site d'inscription d'une compétition de tir à l'arc.
> Aidez-nous à investiguer sur cette attaque via le fichier de logs de notre serveur. Quel est l'URL complète (formée du nom de domaine, puis de la ressource), qui a permis de se connecter de manière frauduleuse ?

> Le flag attendu est l'URL utilisée par l'attaquant pour exploiter une vulnérabilité du site avec succès, entouré du format habituel.
> Par exemple, si l'attaquant se rend sur la page https://example.com/page.php?authenticated=1 pour se connecter de manière frauduleuse, le flag sera 404CTF{https://example.com/page.php?authenticated=1}.
> Le décodage url n'est pas nécessaire.
> Par ailleurs, toutes les IP utilisées sont fictives et non pertinentes.

Auteur: **@ElPouleto**

## Analyse

Le fichier `access.log` contient des logs agencés de la manière suivante:

```
37.19.205.203 - - [19/Feb/2024:14:38:13 -0500] "GET /index.php?username=admin&password=admin123 HTTP/1.1" 302 784 "http://www.inscription_tir_arc.com/" "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:122.0) Gecko/20100101 Firefox/122.0"
```

Nous devons retrouver une url utilisée par l'attaquant pour contourner le système de connexion ou exploiter une faille de sécurité.

La partie qui nous intéresse est donc celle juste après la date et la méthode GET (ici /index.php?username=admin&password=admin123).

On observe que l'attaquant a tenté plusieurs combinaisons d'utilisateur/mot_de_passe pour se connecter, puis a tenté des injections SQL.

## Exploitation

Pour gagner du temps j'ai effectué un script qui récupère toutes les URL requêtées par l'attaquant, une regex comme `r'GET\s(.*?)\sHTTP\/1\.1'` a fait l'affaire.

Ensuite j'affiche directement le bon format de flag à extraire pour finir le challenge.

```Python
import re

# Regex pour extraire la partie entre "GET" et "HTTP/1.1"
regex = r'GET\s(.*?)\sHTTP\/1\.1'

unique_urls = set()

with open('access.log', 'r') as file:

    for line in file:
        
        match = re.search(regex, line)

        if match:
            print("404CTF{"+f"http://www.inscription_tir_arc.com{match.group(1)}"+"}")
```
```
404CTF{http://www.inscription_tir_arc.com/index.php?username=admin%27%23&password=test}
404CTF{http://www.inscription_tir_arc.com/index.php?username=admin%22+AND+password+LIKE+%27a%25%27%23&password=test}
404CTF{http://www.inscription_tir_arc.com/index.php?username=cam&password=KOKVr8Kw4pahwrAp4pWv77i1IOKUu+KUgeKUux==}
404CTF{http://www.inscription_tir_arc.com/index.php?username=cam&password=KOKVr8Kw4pahwrAp4pWv77i1IOKUu+KUgeKUuw==}
404CTF{http://www.inscription_tir_arc.com/index.php?username=admin%22+AND+password+LIKE+%27a%25%27%23&password=}
404CTF{http://www.inscription_tir_arc.com/index.php?username=dominique&password=4pSs4pSA4pSs44OOKCDCuiBfIMK644OOKQ==}
404CTF{http://www.inscription_tir_arc.com/admin.php}
404CTF{http://www.inscription_tir_arc.com/index.php?username=alice&password=securepzss}
404CTF{http://www.inscription_tir_arc.com/index.php?username=john_doe&password=password123}
404CTF{http://www.inscription_tir_arc.com/index.php?username=admin&password=admin123}
404CTF{http://www.inscription_tir_arc.com/index.php?username=nana&password=P4ssw0rd:}
404CTF{http://www.inscription_tir_arc.com/index.php?username=nana&password=P4ssw0rd!}
404CTF{http://www.inscription_tir_arc.com/index.php?username=+%27OR+%27a%27%3D%27a&password=test}
404CTF{http://www.inscription_tir_arc.com/index.php?username=admin&password=admin}
404CTF{http://www.inscription_tir_arc.com/index.php?username=+%22OR+%27a%27%3D%27a&password=test}
404CTF{http://www.inscription_tir_arc.com/index.php?username=toto&password=toto123}
404CTF{http://www.inscription_tir_arc.com/}
404CTF{http://www.inscription_tir_arc.com/index.php?username=alice&password=securepass}
```
On extrait ensuite toutes les injections SQL.

Après utilisation de URL Decode dans CyberChef il nous reste les suivants candidats:
```
404CTF{http://www.inscription_tir_arc.com/index.php?username=admin" AND password LIKE 'a%'#&password=test}
404CTF{http://www.inscription_tir_arc.com/index.php?username=admin" AND password LIKE 'a%'#&password=}
404CTF{http://www.inscription_tir_arc.com/index.php?username= 'OR 'a'='a&password=test}
404CTF{http://www.inscription_tir_arc.com/index.php?username= "OR 'a'='a&password=test}
```

Chacune de ces injections sont pertinentes mais `'OR 'a'='a&password=test` contient une faute, `username=admin" AND password LIKE 'a%'#&password=test` ne marcherait pas si le mot de passe de l'admin ne contient pas de "a", alors que `"OR 'a'='a&password=test` permet directement de se connecter.

Flag: **404CTF{http://www.inscription_tir_arc.com/index.php?username= "OR 'a'='a&password=test}**