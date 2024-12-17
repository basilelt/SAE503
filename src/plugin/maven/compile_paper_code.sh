#!/bin/bash
set -e

BUILD_DIR="/app/build/paper"
mkdir -p "$BUILD_DIR"

COMPILED_DIR="/app/compiled_code/paper"
mkdir -p "$COMPILED_DIR"

for dir in /app/source_code/paper/*; do
    if [ -d "$dir" ]; then
        project_name=$(basename "$dir")
        if ls "$COMPILED_DIR"/*"$project_name"*.jar 1> /dev/null 2>&1; then
            echo "Jar file for project $project_name already exists. Skipping."
            continue
        fi
        echo "Project found: $project_name"
        cp -r "$dir" "$BUILD_DIR"
        echo "Building project in $dir"
        cd "$BUILD_DIR/$project_name" || exit
        if [ -f "pom.xml" ]; then
            echo "Found pom.xml in $dir"
            mvn clean install
            JAR_FILE=$(find target -name "*.jar" ! -name "original-*.jar" | head -n 1)
            if [ -n "$JAR_FILE" ]; then
                cp "$JAR_FILE" "$COMPILED_DIR"
                echo "$project_name built successfully."
            else
                echo "No JAR file found for $project_name."
            fi
        else
            echo "No pom.xml found in $dir, skipping"
            continue
        fi
    fi
done