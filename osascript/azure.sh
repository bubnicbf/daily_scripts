#!/bin/bash
# run zure port forward in new terminal window

osascript <<EOD
    tell application "Terminal"
        do script "bash ~/projects/daily_scripts/bash/az-port-forward.sh"
    end tell
EOD

