#!/bin/bash

# Define the directories and files
SERVER_DIR="test_server"
EULA_FILE="$SERVER_DIR/eula.txt"
CONFIG_FILE="$SERVER_DIR/plugins/Plan/config.yml"
BLUEMAP_CONFIG_FILE="$SERVER_DIR/plugins/BlueMap/core.conf"

# Get the current date and time
curdate=$(date +"%Y-%m-%d")
curtime=$(date +"%H:%M:%S")

# Create or update eula.txt and set eula to true
echo "#By changing the setting below to TRUE you are indicating your agreement to our EULA (https://aka.ms/MinecraftEULA)." > "$EULA_FILE"
echo "# $curdate $curtime" >> "$EULA_FILE"
echo "eula=true" >> "$EULA_FILE"
echo "Created or updated eula.txt and set eula to true."

# Ensure GeoLite2 EULA is accepted in config.yml
if [ -f "$CONFIG_FILE" ]; then
    sed -i 's/Accept_GeoLite2_EULA: false/Accept_GeoLite2_EULA: true/' "$CONFIG_FILE"
    echo "Updated config.yml to accept GeoLite2 EULA."
else
    echo "config.yml not found. Please ensure the file exists and try again."
fi

# Ensure required file download is accepted for BlueMap
if [ -f "$BLUEMAP_CONFIG_FILE" ]; then
    sed -i 's/accept-download: false/accept-download: true/' "$BLUEMAP_CONFIG_FILE"
    echo "Updated core.conf to accept required file download for BlueMap."
else
    echo "core.conf not found. Please ensure the file exists and try again."
fi