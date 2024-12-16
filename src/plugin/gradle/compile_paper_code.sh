#!/bin/bash
# To allow the script to work correctly,
# edit your gradle build files, to build 
# the plugin jar at the root of the project

set -e

BUILD_DIR="/app/build/paper"
mkdir -p "$BUILD_DIR"

for dir in /app/source_code/paper/*; do
    if [ -d "$dir" ]; then
        project_name=$(basename "$dir")
        echo "Project found: $project_name"
        cp -r "$dir" "$BUILD_DIR"
        echo "Building Gradle project in $dir"
        cd "$BUILD_DIR/$project_name" || exit
        if [ -f "gradlew" ]; then
            echo "Found gradlew in $dir"
            chmod +x gradlew
            ./gradlew clean build
            echo "Copying JAR file to /app/compiled_code/velocity/"
            JAR_FILE=$(find . -maxdepth 1 -name "*.jar" ! -name "*-sources.jar" ! -name "*-javadoc.jar" | head -n 1)
            echo "JAR file found: $JAR_FILE"
            if [ -n "$JAR_FILE" ]; then
                DEST_DIR="/app/compiled_code/paper/"
                mkdir -p "$DEST_DIR"
                cp "$JAR_FILE" "$DEST_DIR"
                echo "$project_name built successfully."
            else
                echo "No JAR file found for $project_name."
            fi
        else
            echo "No Gradle build file found in $dir, skipping"
            continue
        fi
    fi
done