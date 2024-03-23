#!/bin/bash

# Check if SDKMAN! is already installed
if [ -d "$HOME/.sdkman" ]; then
    echo "SDKMAN! is already installed."
else
    # Download and install SDKMAN!
    curl -s "https://get.sdkman.io" | bash

    # Source SDKMAN! script to initialize it
    source "$HOME/.sdkman/bin/sdkman-init.sh"

    # Verify SDKMAN! installation
    sdk version

    echo "SDKMAN! has been installed successfully."
fi

# Install Java 17.0.10-jbr
sdk install java 17.0.10-jbr

echo "Java 17.0.10-jbr has been installed successfully."
