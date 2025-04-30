# BloodHound Setup and Usage Guide (Windows)

BloodHound is a powerful tool for mapping relationships and attack paths in Active Directory environments. This guide outlines how to install and use BloodHound and SharpHound on a Windows system.

---

## Prerequisites

- A Windows 10/11 domain-joined machine
- Domain user credentials
- Internet access (for downloading tools)

---

## Step 1: Download BloodHound GUI

1. Visit the [BloodHound GitHub Releases page](https://github.com/BloodHoundAD/BloodHound/releases)
2. Download the latest Windows `.zip` file
3. Extract the archive
4. Launch `BloodHound.exe` from the extracted folder

---

## Step 2: Download SharpHound (Data Collector)

You can choose between:
- `SharpHound.exe` (binary)
- `Invoke-BloodHound.ps1` (PowerShell script)

Download location:  
[https://github.com/BloodHoundAD/SharpHound](https://github.com/BloodHoundAD/SharpHound)

---

## Step 3: Collect Data

### Option A: PowerShell Method

```powershell
Import-Module .\SharpHound.ps1
Invoke-BloodHound -CollectionMethod All -Domain CONTOSO.LOCAL -ZipFileName data.zip
```

### Option B: Executable Method

```cmd
SharpHound.exe -c All
```

The `-c All` flag runs all collection modules (Sessions, ACLs, Group Memberships, Trusts, etc.)

---

## Step 4: Import into BloodHound

1. Open the `BloodHound.exe` GUI
2. Click "Upload Data"
3. Select your generated `data.zip` file
4. Wait for import to complete

---

## Step 5: Analyze the Graph

Use built-in queries like:
- Find Shortest Paths to Domain Admin
- Find Principals with DCSync Rights
- Map Lateral Movement Paths

You can also build custom queries using the Cypher query language.

---

## Common SharpHound Flags

| Flag | Description |
|------|-------------|
| `-c All` | Run all collection modules |
| `-c Session,ACL,Group` | Specific modules only |
| `--EncryptZip` | Encrypt the output `.zip` |
| `-Domain CONTOSO.LOCAL` | Specify the domain |
| `-OutputDirectory .\Results` | Set output location |

---

## Notes

- BloodHound should be run in lab or red-team environments only
- SharpHound needs network access to Domain Controllers
- You may need to whitelist the collector in antivirus settings
