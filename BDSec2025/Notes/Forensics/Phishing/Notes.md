# Notes

## Admin password

(env) ➜  Phishing git:(main) ✗ icat -o 128 disk.raw 45028 > SAM
head -c 4 SAM | xxd

00000000: 7265 6766                                regf
(env) ➜  Phishing git:(main) ✗ icat -o 128 disk.raw 45038 > SYSTEM
head -c 4 SYSTEM | xxd

00000000: 7265 6766                                regf
(env) ➜  Phishing git:(main) ✗ secretsdump.py -sam SAM -system SYSTEM LOCAL

Impacket v0.12.0 - Copyright Fortra, LLC and its affiliated companies 

[*] Target system bootKey: 0xecff3d62df5cb3df5de42d7a12b8dc5f
[*] Dumping local SAM hashes (uid:rid:lmhash:nthash)
Administrator:500:aad3b435b51404eeaad3b435b51404ee:22775c1ecbe2bd7d69c6dcd55b7f9b25:::
Guest:501:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
DefaultAccount:503:aad3b435b51404eeaad3b435b51404ee:31d6cfe0d16ae931b73c59d7e0c089c0:::
WDAGUtilityAccount:504:aad3b435b51404eeaad3b435b51404ee:4fa9775c90b54e688035a28e04d59a3c:::
james.l:1000:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
amir.k:1001:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
sadia.b:1002:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
karim.r:1003:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
anika.d:1004:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
rashed.h:1005:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
nafisa.j:1006:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
sumon.t:1007:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
nazia.c:1008:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
arif.w:1009:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
kamal.n:1010:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
bilkis.z:1011:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
rubel.m:1012:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
tania.y:1013:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
robin.p:1014:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
sohan.v:1015:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
nayeem.d:1016:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
salma.q:1017:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
hossain.a:1018:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
meem.u:1019:aad3b435b51404eeaad3b435b51404ee:89551acff8895768e489bb3054af94fd:::
support_admin:1020:aad3b435b51404eeaad3b435b51404ee:8a46225c4f14f99711b0c2d6002d3af2:::