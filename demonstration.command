#!/bin/bash
# showcase how I set up my desktop the way I like

open -a "Google Chrome" "https://mail.notes.na.collabserv.com/verse";

osascript <<EOD
    tell application "Spotify"
        play track "spotify:album:2fVoMCmIU7YyPGQfaByFhf"
    end tell
    tell application "Terminal"
        do script "reach"
        set the bounds of the first window to {700, 450, 1400, 900}
    end tell
    tell application "Reminders"
        activate
        set the bounds of the first window to {700, 0, 1400, 450}
    end tell
    tell application "Google Chrome"
        set the bounds of the first window to {0, 0, 700, 900}
    end tell
EOD

open /Applications/Statusfy.app;
