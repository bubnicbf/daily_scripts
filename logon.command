#!/bin/bash
# set up my desktop the way I like

open -a "Google Chrome" "https://vbc-confluence.watson-health.ibm.com/spaces/viewspace.action?key=~ben.bubnick";
open -a "Google Chrome" "https://vbc-jira.watson-health.ibm.com/issues/?jql=assignee%20%3D%20%22bfbubnic%40us.ibm.com%22%20AND%20resolution%20%3D%20Unresolved%20order%20by%20updated%20desc";
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
