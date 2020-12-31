#!/bin/bash
# set up my desktop the way I like

open -a "Google Chrome" "https://vbc-confluence.watson-health.ibm.com/spaces/viewspace.action?key=~ben.bubnick";
open /Applications/IBM\ Firefox.app;
open /Applications/Slack.app;
open /Applications/Sublime\ Text.app;
open /Applications/Todoist.app;

osascript <<EOD
    tell application "Terminal"
        do script "projects"
    end tell
    tell application "Spotify"
        activate
        play track "spotify:playlist:37i9dQZF1DXc8kgYqQLMfH"
    end tell     
EOD

open /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app;
source ~/projects/chunichi_dragons/nagoya.properties; echo -n $AD | pbcopy;
