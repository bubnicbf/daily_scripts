#!/bin/bash

# starts a local server to preview a web site in firefox

# --- Handle Arguments ---
SITE_PATH="$1"
PORT="${2:-8000}"  # Default to port 8000 if not specified

# --- Validate Site Path ---
if [ -z "$SITE_PATH" ]; then
  echo "Usage: $0 /path/to/your/site [port]"
  exit 1
fi

if [ ! -d "$SITE_PATH" ]; then
  echo "Error: Directory '$SITE_PATH' does not exist."
  exit 1
fi

# --- Launch Python HTTP Server in New Terminal ---
osascript <<EOF
tell application "Terminal"
    do script "cd \"$SITE_PATH\" && python3 -m http.server $PORT"
end tell
EOF

# --- Give server a second to start ---
sleep 1

# --- Open in Firefox ---
open -a "Firefox" "http://localhost:$PORT"
