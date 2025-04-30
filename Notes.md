## Enterprise Servers 192.168.17.0/26
IP range: 192.168.17.0 – 192.168.17.63
Usable hosts: 62
nmap -sS 192.168.17.1-59,192.168.17.61-62

## Active Directory – 192.168.17.96/28
IP range: 192.168.17.96 – 192.168.17.111
Usable hosts: 14
nmap -sS 192.168.17.97-109

## DMZ – 192.168.17.64/27
IP range: 192.168.17.64 – 192.168.17.95
Usable hosts: 30
nmap -sS 192.168.17.65-91,192.168.17.93-94

## Business – 192.168.16.128/25
IP range: 192.168.16.128 – 192.168.16.255
Usable hosts: 126
nmap -sS 192.168.16.129-93,192.168.16.95-125,192.168.16.127-254

## SOC Analysts – 192.168.15.0/24
IP range: 192.168.15.0 – 192.168.15.255
Usable hosts: 254

## Admin – 192.168.16.64/27
IP range: 192.168.16.64 – 192.168.16.95
Usable hosts: 30
nmap -sS 192.168.16.65-94

## Dev – 192.168.16.96/27
IP range: 192.168.16.96 – 192.168.16.127
Usable hosts: 30
nmap -sS 192.168.16.97-125

## SecOnion Management – 192.168.58.0/27
IP range: 192.168.58.0 – 192.168.58.31
Usable hosts: 30

## SecOnion Access – 192.168.60.0/26
IP range: 192.168.60.0 – 192.168.60.63
Usable hosts: 62
