# Write-Up – Small Jail Portal (Python Jail)

🧩 Enoncé

Le serveur affiche un prompt interactif style Python REPL, avec une accroche énigmatique :
```
=== Small Jail Portal===
portal is very user‑friendly, but it has a secret.
But portal is very picky to choose friends.
=========================================
```

On comprend rapidement qu’on est face à un Python Jail, c’est-à-dire une sandbox Python conçue pour empêcher l’exécution de code malveillant. Le but est probablement d’accéder à une variable cachée (typiquement une flag).
🧪 Phase d’expérimentation (essais/erreurs)
✅ Ce qui fonctionne

Certaines fonctions et types standards sont disponibles :

    Fonctions built-in simples :

        abs, bool, int, float, print, sum, sorted, etc.

    Fonctions introspectives utiles :

        getattr(obj, attr) fonctionne très bien, même avec des objets retournés dynamiquement.

        isinstance(obj, type) fonctionne aussi.

    Accès à certains types :

        int, str, list, tuple, etc., sont accessibles.

    Exemple :
    getattr(list(), "append") retourne la méthode append, donc getattr peut être utilisé comme un outil principal pour la suite.

❌ Ce qui est bloqué

Des protections empêchent certains accès classiques :

    Pas de eval(), exec(), ni __import__

    vars(), locals(), globals() : refusés ou génèrent des erreurs

    Les variables définies localement (ex : lst = []) ne persistent pas ou lèvent des erreurs

    Impossible de déclarer une fonction ou d’utiliser des constructs multi-lignes