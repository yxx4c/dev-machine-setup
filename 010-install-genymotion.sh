#!/bin/bash

# Define the download URL for Genymotion
GENYMOTION_URL="https://dl.genymotion.com/releases/genymotion-3.6.0/genymotion-3.6.0-linux_x64.bin"

# Define the download directory
DOWNLOAD_DIR="$HOME/Downloads"

# Define the installation directory
INSTALL_DIR="$HOME/.local/app/"

# Create the download directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

# Navigate to the download directory
cd "$DOWNLOAD_DIR" || exit

# Download Genymotion
echo "Downloading Genymotion..."
wget "$GENYMOTION_URL"

# Make the downloaded file executable
chmod +x genymotion-*.bin

# Install Genymotion
echo "Installing Genymotion..."
./genymotion-*.bin -d "$INSTALL_DIR"

# Clean up the downloaded file
rm genymotion-*.bin

ln -s $HOME/.local/app/genymotion/genymotion $HOME/.local/bin/genymotion

echo "Genymotion has been installed to $INSTALL_DIR."
