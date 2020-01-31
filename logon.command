#!/bin/bash
# set up my desktop the way I like

osascript <<EOD
    tell application "Terminal"
        do script "projects"
        set the bounds of the first window to {0, 730, 1280, 1420}
    end tell
EOD

open -a "Google Chrome" "https://vbc-confluence.watson-health.ibm.com/spaces/viewspace.action?key=~ben.bubnick";
open /Applications/IBM\ Firefox.app;
open /Applications/Spotify.app;
open /Applications/Statusfy.app;
open /Applications/Slack.app;
open /Applications/DBeaver.app;
open /Applications/Sublime\ Text.app;
open /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app;

osascript <<EOD
    tell application "Messages"
        activate
        set the bounds of the first window to {1280, 735, 1960, 1430}
    end tell
    tell application "Reminders"
        activate
        set the bounds of the first window to {1280, 735, 1960, 1430}
    end tell
    tell application "Google Chrome"
        set the bounds of the first window to {2560, 0, 5060, 1430}
    end tell
    tell application "System Events" to tell process "Firefox"
        set value of attribute "AXFullScreen" of window 1 to true
    end tell
    tell application "Terminal"
        do script "w3m old.reddit.com/r/bestoflegaladvice"
        set the bounds of the first window to {1960, 735, 2560, 1430}
    end tell
EOD

source /Users/ben.bubnick/Documents/pass.properties; echo -n $ADPASS | pbcopy;

osascript <<EOD
    tell application "System Events" to tell process "DBeaver"
        tell window 1
            set size to {1280, 715}
            set position to {0, 0}
        end tell
    end tell
    tell application "System Events" to tell process "Sublime Text"
        tell window 1
            set size to {1280, 715}
            set position to {1280, 0}
        end tell
    end tell
EOD