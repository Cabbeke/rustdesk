#!/usr/bin/env bash
set -e

APP_NAME="WebWorx Cabbeke"
SERVER="remote.webworxcabbeke.be"

echo "▶ Branding RustDesk client..."

# App naam
sed -i 's/pub const APP_NAME: &str = ".*";/pub const APP_NAME: \&str = "'"$APP_NAME"'";/' src/common.rs

# Default server injecteren
sed -i 's/DEFAULT_SERVER = .*/DEFAULT_SERVER = "'"$SERVER"'";/' src/client.rs || true

# Server locken
sed -i 's/allow_change_server: true/allow_change_server: false/' src/client.rs || true

# Assets vervangen
cp branding/logo.png res/logo.png
cp branding/icon.ico res/icon.ico
cp branding/icon.png res/icon.png
cp branding/icon.icns res/icon.icns

echo "✅ Branding toegepast"
