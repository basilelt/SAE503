#!/bin/bash
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
            ./gradlew clean build
            read -p "Press Enter to continue..."
            JAR_FILE=$(find build/libs -name "*.jar" ! -name "*-sources.jar" ! -name "*-javadoc.jar" | head -n 1)
            if [ -n "$JAR_FILE" ]; then
                DEST_DIR="/app/compiled_code/$project_name/"
                mkdir -p "$DEST_DIR"
                cp "$JAR_FILE" "$DEST_DIR"
                echo "$project_name built successfully."
            else
                echo "No JAR file found for $project_name."
            fi
        elif [ -f "build.gradle" ] || [ -f "build.gradle.kts" ]; then
            gradle clean build
            JAR_FILE=$(find build/libs -name "*.jar" ! -name "*-sources.jar" ! -name "*-javadoc.jar" | head -n 1)
            if [ -n "$JAR_FILE" ]; then
                DEST_DIR="/app/compiled_code/$project_name/"
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