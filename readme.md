# OpenMediaVault Setup Script

This script automates the installation and configuration of an **OpenMediaVault** environment with additional tools such as Docker, Fastfetch, and OMV-Extras.  
It is intended for **Debian-based systems** and should be executed with **root privileges**.

---

## 📋 Features

- **System update and cleanup**
  - Updates all installed packages.
  - Installs essential utilities: `ca-certificates`, `curl`, `gnupg`, `lsb-release`, `wget`, `htop`, `lm-sensors`.
  - Removes unnecessary packages.

- **Docker installation**
  - Installs Docker and related plugins from the **official Docker repository**.

- **Fastfetch installation**
  - Automatically downloads and installs the latest AMD64 `.deb` release from GitHub.

- **OMV-Extras installation**
  - Adds the OMV-Extras plugin repository for OpenMediaVault.

- **Custom tweaks**
  - Creates two user groups: `Administradores` and `Usuarios`.


## ⚠️ Requirements

- A **Debian-based** distribution (tested on Debian).
- **Root privileges**.
- Internet connection.

---

## 🚀 Quick Installation

You can execute the script **directly from GitHub** without downloading it manually:

```bash
wget -O - https://raw.githubusercontent.com/galvezsh/OpenMediaVault-Setup/master/configure.sh | bash
```

---

## 📂 Step-by-step Actions

1. Check root privileges
Ensures the script is executed as the root user.

2. Update and upgrade the system
Installs required packages and removes unnecessary ones.

3. Install Docker
Sets up Docker's official repository and installs:

- docker-ce
- docker-ce-cli
- containerd.io
- docker-buildx-plugin
- docker-compose-plugin

4. Install Fastfetch
Fetches the latest release directly from GitHub and adds fastfetch to .bashrc.

5. Install OMV-Extras
Executes the OMV-Extras installation script from GitHub.

6. Custom tweaks
Creates user groups Administradores and Usuarios.


## 📝 Notes

- Root requirement: The script will terminate if not run as root.
- System changes: This script modifies system repositories and installs software globally.
- Fastfetch: Installed for quick system info display when opening a terminal.

---

## 📜 License

This script is provided as-is without warranty.
You are free to modify and distribute it under your own terms.