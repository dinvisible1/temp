# Script-Based System Hardening (Lab Context)

This guide provides system hardening scripts for Windows and Linux systems in a lab environment.

---

## Windows Hardening Script (PowerShell)

Run this script as an Administrator in PowerShell:

```powershell
# Enable Windows Firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Disable SMBv1
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol -NoRestart

# Disable Guest Account
Net user guest /active:no

# Enable Windows Defender
Set-MpPreference -DisableRealtimeMonitoring $false

# Enable SmartScreen Network Protection
Set-MpPreference -EnableNetworkProtection Enabled

# Configure Password Policy
secedit /export /cfg C:\secpol.cfg
(gc C:\secpol.cfg).replace("MinimumPasswordLength = 0","MinimumPasswordLength = 12") | Out-File C:\secpol.cfg
secedit /configure /db secedit.sdb /cfg C:\secpol.cfg

# Disable Remote Desktop (RDP)
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server" -Name "fDenyTSConnections" -Value 1

# Enable Windows Update Service
Set-Service -Name wuauserv -StartupType Automatic
Start-Service wuauserv

# Configure Audit Policy
auditpol /set /subcategory:"Logon" /success:enable /failure:enable
auditpol /set /subcategory:"Object Access" /success:enable /failure:enable
auditpol /set /subcategory:"Privilege Use" /success:enable /failure:enable
```

---

## Linux Hardening Script (Ubuntu/Debian)

Run this script as root or with sudo:

```bash
#!/bin/bash

# Update System
apt update && apt upgrade -y

# Enable UFW Firewall
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw enable

# Disable Root SSH Login
sed -i 's/^PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart sshd

# Set Strong Password Policy
apt install libpam-pwquality -y
echo 'password requisite pam_pwquality.so retry=3 minlen=12 ucredit=-1 lcredit=-1 dcredit=-1' >> /etc/pam.d/common-password

# Enable Automatic Updates
apt install unattended-upgrades -y
dpkg-reconfigure --priority=low unattended-upgrades

# Enable Audit Logging
apt install auditd -y
auditctl -e 1

# Remove Unnecessary Packages
apt purge telnet rsh-server xinetd -y

# Create a Non-root Admin User
adduser socadmin
usermod -aG sudo socadmin
```

---

> Always test hardening scripts in a lab environment before applying them in production.
