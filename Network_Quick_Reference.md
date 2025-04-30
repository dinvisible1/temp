# Network Quick Reference and Nmap Commands

This document provides a summary of subnet roles, IP ranges, and safe Nmap scan commands for each segment of a lab environment.

---

## Enterprise Servers

- **Subnet**: 192.168.17.0/26
- **Usable Range**: 192.168.17.1 – 192.168.17.62
- **Excludes**: 192.168.17.60
- **Purpose**: Hosts enterprise apps (ERP, DB, etc.)

```bash
nmap -sS 192.168.17.1-59,192.168.17.61-62
```

---

## Active Directory

- **Subnet**: 192.168.17.96/28
- **Usable Range**: 192.168.17.97 – 192.168.17.110
- **Excludes**: 192.168.17.110
- **Purpose**: Domain Controllers, DNS, Kerberos

```bash
nmap -sS 192.168.17.97-109
```

---

## DMZ

- **Subnet**: 192.168.17.64/27
- **Usable Range**: 192.168.17.65 – 192.168.17.94
- **Excludes**: 192.168.17.92
- **Purpose**: Public-facing services (web, mail)

```bash
nmap -sS 192.168.17.65-91,192.168.17.93-94
```

---

## Business Workstations

- **Subnet**: 192.168.16.128/25
- **Usable Range**: 192.168.16.129 – 192.168.16.254
- **Excludes**: 192.168.16.94, 192.168.16.126
- **Purpose**: General end-user devices

```bash
nmap -sS 192.168.16.129-93,192.168.16.95-125,192.168.16.127-254
```

---

## Admin Zone

- **Subnet**: 192.168.16.64/27
- **Usable Range**: 192.168.16.65 – 192.168.16.94
- **Purpose**: IT support and system administration

```bash
nmap -sS 192.168.16.65-94
```

---

## Developer Zone

- **Subnet**: 192.168.16.96/27
- **Usable Range**: 192.168.16.97 – 192.168.16.126
- **Excludes**: 192.168.16.126
- **Purpose**: Development and testing

```bash
nmap -sS 192.168.16.97-125
```

---

## Restricted or Guarded Zones (Do Not Scan)

| Subnet/Host              | Description                        |
|--------------------------|------------------------------------|
| 192.168.15.0/24          | SOC Analysts Network               |
| 172.16.99.0/26           | Backbone Routing                   |
| 192.168.58.0/27          | Security Onion Management          |
| 192.168.60.0/26          | Security Onion Sensors             |
| 172.16.99.62             | Guarded host (core infra)          |
| 192.168.15.252           | Guarded host                       |
| 192.168.17.60, .92, .110 | Guarded AD/DMZ hosts               |
| 192.168.16.94, .126      | Guarded admin/dev hosts            |
| 169.254.169.254          | Reserved cloud metadata endpoint   |

---

This document is designed for quick reference in lab environments where safe reconnaissance is permitted.
