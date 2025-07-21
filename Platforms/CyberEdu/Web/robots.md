# Robots
## Statement
> Find the flag for this website

Author: **@skyv3il**

Login: http://35.198.79.xx:30833/

## Analysis

The title is pretty explicit, we have to connect to the web server and check for the robots.txt directory.

## Exploitation

We go the the `/robots.txt` path and we see this:

```
User-agent: *
Disallow: /g00d_old_mus1c.php
```

We can reach `/g00d_old_mus1c.php` and we get the flag:

```
A robots.txt file tells search engine crawlers which URLs the crawler can access on your site.
Anyway, I hope you like this music

But probably you just want your flag, so:

CTF{Kr4ftw3rk_4nd_th3_r0b0ts}
```

Flag: **CTF{Kr4ftw3rk_4nd_th3_r0b0ts}**