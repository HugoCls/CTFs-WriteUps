# Include-This
## Statement
> Find the flag for this website

Author: **@skyv3il**

Login: http://34.159.73.xxx:30085/

## Analysis

When reaching the first page we have a button and when clicking on it we understand that there is a directory traversal to proceed.

When trying things like `?file=../../etc/passwd` we see that there is a filter that deletes each sequence of `../`.

I finaly tryed an old trick which worked:

`http://34.159.73.xxx:30085/?file=....//....//....//....//etc/passwd`

This link gives us the passwd file.

## Exploitation

Now the plan was to try every folder an try to find a flag.txt file.

Fortenately, I found it on the base folder.

Reaching this link `http://34.159.73.xxx:30085/?file=....//....//....//....//flag.txt` gives us the flag.

Flag: **CTF{LF1_L34DS_T0_RC3}**