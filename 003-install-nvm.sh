#!/bin/bash

# Check if NVM is already installed
if [ -d "$HOME/.nvm" ]; then
    echo "NVM is already installed."
else
    # Download and install NVM
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

    # Source NVM script to initialize it
    source "$HOME/.nvm/nvm.sh"

    echo "NVM has been installed successfully."
fi

# Install the latest version of Node.js and npm
nvm install --lts

echo "The latest version of Node.js and npm have been installed successfully."
