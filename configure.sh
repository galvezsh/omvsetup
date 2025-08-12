#!/bin/bash

# === Check root privileges ===
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi
echo "✅ Root privileges confirmed."

# === System update and upgrade ===
echo "🔄 Updating and upgrading the system..."
apt-get update -y
apt-get upgrade -y
apt-get install -y ca-certificates curl gnupg lsb-release wget htop lm-sensors
apt autoremove -y

# === Install Docker from official repository ===
echo "🐳 Installing Docker from the official repository..."
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# === Download and install latest Fastfetch AMD64 from GitHub ===
echo "⚡ Downloading latest Fastfetch release..."
LATEST_URL=$(curl -s https://api.github.com/repos/fastfetch-cli/fastfetch/releases/latest | grep browser_download_url | grep amd64.deb | cut -d '"' -f 4)
wget -O /root/fastfetch.deb "$LATEST_URL"
dpkg -i /root/fastfetch.deb
echo "fastfetch" >> /root/.bashrc

# === Install OMV-Extras ===
echo "📦 Installing OMV-Extras..."
wget -O - https://github.com/OpenMediaVault-Plugin-Developers/packages/raw/master/install | bash 

# === Small customs tweaks ===
groupadd Administradores
groupadd Usuarios

echo "✅ Installation complete."
