#!/bin/bash

# Create the AppDir directory
mkdir -p AppDir/usr/bin
mkdir -p AppDir/usr/share/applications
mkdir -p AppDir/usr/share/icons

# Create an AppRun script
cat > AppDir/AppRun <<EOF
#!/bin/sh

# Set the path to the Qt5 executable
QT_EXECUTABLE="./usr/bin/welcome_window"

# Change directory to the location of the Qt5 executable
cd "\$(dirname "\$0")"

# Execute the Qt5 application
\$QT_EXECUTABLE "\$@"
EOF

# Make the AppRun script executable
chmod +x AppDir/AppRun

# Create a sample desktop file
cat > AppDir/usr/share/applications/your_application.desktop <<EOF
[Desktop Entry]
Name=Your Application
Exec=AppRun
Icon=
Type=Application
Categories=Utility;
EOF

# Make the desktop file writable
chmod +x AppDir/usr/share/applications/your_application.desktop

echo "AppDir structure created successfully!"
