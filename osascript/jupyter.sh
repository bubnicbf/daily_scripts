#!/bin/bash
# run jupyter notebook from terminal window

osascript <<EOD
    tell application "Terminal"
        do script "cd ~/projects; jupyter notebook"
    end tell
EOD

