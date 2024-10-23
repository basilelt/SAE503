#!/bin/bash

# Define the directory where the server jar is located
SERVER_DIR="test_server"

# Define the name of the server jar file
SERVER_JAR="paper-*.jar"

# Change to the server directory
cd "$SERVER_DIR" || exit

# Find the server jar file
SERVER_JAR_FILE=$(ls $SERVER_JAR 2>/dev/null | head -n 1)

if [ -z "$SERVER_JAR_FILE" ]; then
    echo "Server jar file not found. Please ensure the file exists and try again."
    exit 1
fi

# Start the server
java -Xms1G -Xmx2G -jar "$SERVER_JAR_FILE" nogui

# Return to the original directory
cd - || exit