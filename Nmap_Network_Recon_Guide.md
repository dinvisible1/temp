# Network Reconnaissance Guide with Nmap

This guide outlines a fast, structured approach to network discovery, fingerprinting, and vulnerability analysis using Nmap.

---

## Step 1: Fast Host Discovery – Nmap

Use a fast ping sweep to discover which hosts are alive in approved scan ranges.

```bash
nmap -sn 192.168.17.1-59,192.168.17.61-62 \
          192.168.17.65-91,192.168.17.93-94 \
          192.168.17.97-109 \
          192.168.16.129-93,192.168.16.95-125,192.168.16.127-254 \
          192.168.16.65-94 \
          192.168.16.97-125 -oA scan_host_discovery
```

- `-sn`: Ping only
- `-oA`: Output in all formats (.nmap, .gnmap, .xml)

---

## Step 2: Service & OS Fingerprinting – Nmap

Once hosts are identified, scan them for open ports, running services, and OS details.

```bash
nmap -sS -sV -O -T4 -p- -iL scan_host_discovery.gnmap -oA scan_services
```

- `-sS`: TCP SYN scan
- `-sV`: Service version detection
- `-O`: OS detection
- `-T4`: Timing template for speed
- `-p-`: Scan all ports
- `-iL`: Input from previous host discovery
- `-oA`: Output in all formats

---

## Step 3: Vulnerability Snapshot – Nmap NSE

Use Nmap’s built-in scripting engine to identify known vulnerabilities on discovered services.

```bash
nmap -sV --script vuln -iL scan_host_discovery.gnmap -oA vuln_report
```

- `--script vuln`: Run scripts from the "vuln" category
- `-sV`: Version detection
- `-iL`: Input list from host discovery
- `-oA`: Output in all formats

---

Use these steps to quickly gain insight into a lab or live network with minimal overhead.
