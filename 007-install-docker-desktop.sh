#!/bin/bash

# Define the download URL for Docker Desktop .deb package
DOCKER_DESKTOP_URL="https://desktop.docker.com/linux/main/amd64/139021/docker-desktop-4.28.0-amd64.deb"

# Define the download directory
DOWNLOAD_DIR="$HOME/Downloads"

# Define the installation command
INSTALL_COMMAND="sudo apt-get install docker-desktop-*.deb -y"

# Create the download directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

# Navigate to the download directory
cd "$DOWNLOAD_DIR" || exit

# Download Docker Desktop .deb package
echo "Downloading Docker Desktop..."
wget "$DOCKER_DESKTOP_URL"

# Install Docker Desktop
echo "Installing Docker Desktop..."
$INSTALL_COMMAND

# Clean up the downloaded file
rm docker-desktop-*.deb

echo "Docker Desktop has been installed successfully."
