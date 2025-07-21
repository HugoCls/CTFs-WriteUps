# Notes

as
os
or

## Ce qui marche bien d’après tes tests

    Fonctions built-in simples comme abs, bool, int, float, print, sum, sorted

    getattr fonctionne sur objets littéraux prédéfinis (ex: getattr(list(), "append") renvoie la méthode)

    isinstance fonctionne

    Types simples comme int, list, str sont accessibles (mais créer une variable locale semble bloqué)

## Ce qui ne marche pas

    Appeler vars(), locals() ou toute fonction qui accède à la portée actuelle est refusé (NameError ou ValueError)

    Les variables locales définies (ex: lst = []) ne sont pas conservées ou générent des erreurs au moment d’accès

    Pas possible de faire exec() ni eval()

    Pas d’accès direct à __import__