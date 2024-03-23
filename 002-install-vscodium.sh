#!/bin/bash

# Download the latest .deb package of VSCodium
wget -O /tmp/vscodium.deb $(curl -s https://api.github.com/repos/VSCodium/vscodium/releases/latest | grep "browser_download_url.*amd64.deb" | cut -d : -f 2,3 | tr -d \")

# Install VSCodium from the downloaded .deb package
sudo dpkg -i /tmp/vscodium.deb

# Install any missing dependencies
sudo apt-get install -f

# Remove the downloaded .deb package
rm /tmp/vscodium.deb

echo "VSCodium installed successfully."
