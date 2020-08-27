#!/bin/bash
# set up my desktop the way I like

osascript <<EOD
    tell application "Terminal"
        do script "projects"
    end tell
EOD

open -a "Google Chrome" "https://vbc-confluence.watson-health.ibm.com/spaces/viewspace.action?key=~ben.bubnick";
open /Applications/IBM\ Firefox.app;
open /Applications/Spotify.app;
open /Applications/Slack.app;
open /Applications/Sublime\ Text.app;

open /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app;
source ~/projects/chunichi_dragons/nagoya.properties; echo -n $AD | pbcopy;
