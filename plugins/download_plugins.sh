#!/bin/bash

# Define the directories where mods will be downloaded
PLUGINS_DIR="plugins/test_server/plugins"
SERVER_DIR="plugins/test_server"

# Create the directories if they don't exist
mkdir -p "$PLUGINS_DIR"
mkdir -p "$SERVER_DIR"

# Read the list of mod URLs from the plugins_list.txt file
while IFS= read -r url; do
    # Check if the URL is for the paper jar
    if [[ "$url" == *"paper-"*".jar" ]]; then
        # Download the paper jar to the server directory
        wget -P "$SERVER_DIR" "$url"
    else
        # Download other mods to the plugins directory
        wget -P "$PLUGINS_DIR" "$url"
    fi
done < "plugins_list.txt"

echo "Plugins have been downloaded to $PLUGINS_DIR and Paper to $SERVER_DIR"