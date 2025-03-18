#!/bin/bash

# Prompt for new project name
echo "Enter new project name:"
read NEW_NAME

# Replace project name in CMakeLists.txt
echo "Renaming project in CMakeLists.txt..."
sed -i '' "s/AudioPlugin/${NEW_NAME}/g" CMakeLists.txt

# Rename project folder (optional)
if [ -d "AudioPlugin" ]; then
    mv AudioPlugin "${NEW_NAME}"
fi

# Remove old Git history and reinitialize repo
echo "Resetting Git history..."
rm -rf .git
git init
git add .
git commit -m "Initialized ${NEW_NAME} project from template"

# Create a build directory
mkdir -p build

# Ask user which build systems to use
echo "Select build system(s):"
echo "1) Xcode"
echo "2) VS Code (Ninja)"
echo "3) Both"
read -p "Enter choice (1, 2, or 3): " BUILD_CHOICE

# Generate & build Xcode project
if [[ "$BUILD_CHOICE" == "1" || "$BUILD_CHOICE" == "3" ]]; then
    echo "Generating Xcode project..."
    cmake -G "Xcode" -B build/xcode_build ..
    echo "✅ Xcode project generated at: build/xcode_build/${NEW_NAME}.xcodeproj"
    
    echo "Building project with Xcode..."
    cmake --build build/xcode_build --config Release
    echo "✅ Xcode Build Complete!"
fi

# Generate & build VS Code (Ninja) project
if [[ "$BUILD_CHOICE" == "2" || "$BUILD_CHOICE" == "3" ]]; then
    echo "Generating VS Code (Ninja) project..."
    cmake -G "Ninja" -B build/vscode_build ..
    echo "✅ VS Code project generated at: build/vscode_build/"
    
    echo "Building project with Ninja..."
    cmake --build build/vscode_build
    echo "✅ VS Code Build Complete!"
fi

# Print instructions
echo "✅ Project setup complete!"
if [[ "$BUILD_CHOICE" == "1" || "$BUILD_CHOICE" == "3" ]]; then
    echo "➡️ Open Xcode with: open build/xcode_build/${NEW_NAME}.xcodeproj"
fi
if [[ "$BUILD_CHOICE" == "2" || "$BUILD_CHOICE" == "3" ]]; then
    echo "➡️ Open VS Code and configure CMake for Ninja"
fi


echo "🎉 Project setup complete!"
