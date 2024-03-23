#!/bin/bash

# Define variables
GITHUB_REPO="ClementTsang/bottom"
INSTALL_DIR="/tmp"

# Get the latest release information
latest_release=$(curl -sL "https://api.github.com/repos/$GITHUB_REPO/releases/latest")

download_url=$(echo "$latest_release" | grep "browser_download_url.*bottom_.*_amd64.deb" | cut -d '"' -f 4)
deb_file=$(basename $download_url)

# Download the deb file
echo "Downloading $deb_file..."
wget -P $INSTALL_DIR $download_url

# Install the deb file
echo "Installing $deb_file..."
sudo dpkg -i $INSTALL_DIR/$deb_file

# Check if there were any installation errors
if [ $? -eq 0 ]; then
    echo "Installation successful."
else
    echo "Installation failed."
fi

# Clean up the downloaded deb file
rm $INSTALL_DIR/$deb_file
