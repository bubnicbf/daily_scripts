#!/bin/bash
# set up my desktop the way I like

time_until_eod () {
  local -i now=$(date +%s)
  local -i eod=$(date -j -f '%T' "17:00:00" "+%s" )

  local -i S=eod-now
  local -i M=S/60

  echo $M
}

open -a "Google Chrome" "https://vbc-jira.watson-health.ibm.com/issues/?jql=assignee%20%3D%20%22bfbubnic%40us.ibm.com%22%20AND%20resolution%20%3D%20Unresolved%20and%20status%20!%3D%20Blocked%20order%20by%20updated%20desc";
open -a "Google Chrome" "https://vbc-jira.watson-health.ibm.com/secure/Dashboard.jspa?selectPageId=20586";
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
        play track "spotify:playlist:37i9dQZF1E39hBTio44x3B"
    end tell
    tell application "Amphetamine"
        start new session with options {duration:$(time_until_eod), interval:minutes, displaySleepAllowed:false}
    end tell
EOD

open /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app;
source ~/projects/chunichi_dragons/nagoya.properties; echo -n $AD | pbcopy;
