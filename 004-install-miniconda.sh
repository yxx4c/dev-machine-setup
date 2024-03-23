#!/bin/bash

# Define variables
MINICONDA_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
INSTALL_DIR="$HOME/.miniconda"

# Download Miniconda installer
wget $MINICONDA_URL -O ~/miniconda.sh

# Verify the integrity of the installer (optional but recommended)
wget $MINICONDA_URL.sha256 -O ~/miniconda.sha256
sha256sum --check ~/miniconda.sha256

# Run the installer
bash ~/miniconda.sh -b -p $INSTALL_DIR

# Remove the installer
rm ~/miniconda.sh ~/miniconda.sha256

# Activate conda
eval "$INSTALL_DIR/bin/conda shell.zsh hook"

# Initialize conda
conda init

# Verify installation
conda --version