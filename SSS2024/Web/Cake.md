# Web Qualifiers: Cake
## Statement
> Get the flag from Cake.

> We all love applepie.

Author: **@Mocanu Gabriel**

## Analysis

When we arrive in the website almost nothing happens except a php session created and a cookie FLAG filled with empty value.

When looking a little further we see that a web server is running `Apache/2.4.38 (Debian)` & `PHP/7.2.34` is running, we may tryna find exploits on this version or earlyer versions on the web.


We find a lot of CVECs in there: [Exploits](https://www.cvedetails.com/vulnerability-list/vendor_id-45/product_id-66/version_id-613554/Apache-Http-Server-2.4.38.html).

We learn that we can make the server crash, by multiple ways including sending a lot of headers whithout stopping..

I found this one CVE-2019-0215 which is interesting:
> In Apache HTTP Server 2.4 releases 2.4.37 and 2.4.38, a bug in mod_ssl when using per-location client certificate verification with TLSv1.3 allowed a client to bypass configured access control restrictions

But I can't find a way to exploit it

## Exploitation

Looking back to the challenge I remembered the Hint at the beginning.

By changing the cookie FLAG to applepie, the server gives us the flag.

```http
GET / HTTP/1.1
Host: 141.85.224.xxx:8086
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.6367.118 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Accept-Encoding: gzip, deflate, br
Accept-Language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7
Cookie: PHPSESSID=514795191c4dea19261e25a75f9f39d4; FLAG=applepie
Connection: close
```

FLAG=SSS%7Bhansel_gretel%7D

Flag: **SSS{hansel_gretel}**