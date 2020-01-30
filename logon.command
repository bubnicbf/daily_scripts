#!/bin/bash
# set up my desktop the way I like

osascript <<EOD
    tell application "Messages"
        activate
    end tell
    tell application "Reminders"
        activate
    end tell
    tell application "Terminal"
        do script "w3m old.reddit.com/r/bestoflegaladvice"
    end tell
EOD

open -a "Google Chrome" "https://vbc-confluence.watson-health.ibm.com/spaces/viewspace.action?key=~ben.bubnick";
open /Applications/IBM\ Firefox.app;
open /Applications/Spotify.app;
open /Applications/Statusfy.app;
open /Applications/Slack.app;
open /Applications/DBeaver.app;
open /Applications/Sublime\ Text.app;
open /Applications/ILC.app;
open /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app;

source /Users/ben.bubnick/Documents/pass.properties; echo -n $ADPASS | pbcopy;

osascript <<EOD
    tell application "Terminal"
        do script "projects"
    end tell
EOD
