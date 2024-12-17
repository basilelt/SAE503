#!/bin/bash
# To allow the script to work correctly,
# edit your gradle build files to build 
# the plugin jar at the root of the project

set -e

BUILD_DIR="/app/build/velocity"
mkdir -p "$BUILD_DIR"

COMPILED_DIR="/app/compiled_code/velocity"
mkdir -p "$COMPILED_DIR"

for dir in /app/source_code/velocity/*; do
    if [ -d "$dir" ]; then
        project_name=$(basename "$dir")
        # Check if a jar file in the compiled code directory contains the project name
        if ls "$COMPILED_DIR"/*"$project_name"*.jar 1> /dev/null 2>&1; then
            echo "Jar file for project $project_name already exists. Skipping."
            continue
        fi
        echo "Project found: $project_name"
        cp -r "$dir" "$BUILD_DIR"
        echo "Building Gradle project in $dir"
        cd "$BUILD_DIR/$project_name" || exit
        if [ -f "gradlew" ]; then
            echo "Found gradlew in $dir"
            chmod +x gradlew
            ./gradlew clean build
            echo "Copying JAR file to $COMPILED_DIR"
            JAR_FILE=$(find . -maxdepth 1 -name "*.jar" ! -name "*-sources.jar" ! -name "*-javadoc.jar" | head -n 1)
            echo "JAR file found: $JAR_FILE"
            if [ -n "$JAR_FILE" ]; then
                cp "$JAR_FILE" "$COMPILED_DIR"
                echo "$project_name built successfully."
            else
                echo "No JAR file found for $project_name."
            fi
        else
            echo "No gradlew found in $dir, skipping"
            continue
        fi
    fi
done