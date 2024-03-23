#!/bin/bash

# Define the URL for the repository XML
REPO_XML_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"

# Define the download directory
DOWNLOAD_DIR="$HOME/android"

# Define the destination directory
DEST_DIR="$HOME/Android/sdk/cmdline-tools/latest"

# Create the download directory if it doesn't exist
mkdir -p "$DOWNLOAD_DIR"

# Navigate to the download directory
cd "$DOWNLOAD_DIR" || exit

# Download the latest Android command-line tools
echo "Downloading the latest Android command-line tools..."
wget "$REPO_XML_URL" -O commandlinetools.zip

# Extract the downloaded zip file to the destination directory
echo "Extracting the downloaded files..."
mkdir -p "$DEST_DIR"
unzip -o commandlinetools.zip -d temp_cmdline_tools
mv temp_cmdline_tools/cmdline-tools/* "$DEST_DIR"

# Clean up the temporary directory and the downloaded zip file
rm -rf temp_cmdline_tools
rm commandlinetools.zip

# Update .zshrc with Android SDK environment variables
echo -e "\n# Android SDK" >> "$HOME/.zshrc"
echo "export ANDROID_SDK_ROOT=$HOME/Android/sdk" >> "$HOME/.zshrc"
echo "export PATH=\$PATH:\$ANDROID_SDK_ROOT/cmdline-tools/latest/bin" >> "$HOME/.zshrc"
echo "export PATH=\$PATH:\$ANDROID_SDK_ROOT/platform-tools" >> "$HOME/.zshrc"

# Reload .zshrc to apply changes
source "$HOME/.zshrc"

echo "Android command-line tools have been downloaded and extracted to $DEST_DIR."

# Run sdkmanager to install required SDK components
echo "Installing required SDK components..."
sdkmanager "platforms;android-33" "build-tools;33.0.3" "extras;google;m2repository" "extras;android;m2repository" "platform-tools"

echo "Required SDK components have been installed."
