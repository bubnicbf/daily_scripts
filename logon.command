#!/bin/bash
# set up my desktop the way I like

# Get number of minutes until 5pm
time_until_eod () {
    local -i now=$(date +%s)
    local -i eod=$(date -j -f '%T' "17:00:00" "+%s" )

    local -i S=eod-now
    local -i M=S/60

    echo $M
}

# Pick a random spotify from my favorites list
rando_spotify () {
    playlist[0]="37i9dQZF1E39hBTio44x3B"
    playlist[1]="37i9dQZF1E35TbUW8AyH92"
    playlist[2]="37i9dQZF1E351NFGzFy1ar"
    playlist[3]="37i9dQZF1E38cwp812py2i"
    playlist[4]="37i9dQZF1DWYoYGBbGKurt"
    playlist[5]="37i9dQZF1DX0SM0LYsmbMT"
    playlist[6]="37i9dQZF1DXaf6XmhwlgC6"
    playlist[7]="37i9dQZF1E38S1a4SY2jsZ"

    size=${#playlistlist[@]}
    index=$(($RANDOM % $size))
    echo ${playlistlist[$index]}
}

# Open apps I use daily
open /System/Applications/Messages.app
open /Applications/Microsoft\ Outlook.app;
open /Applications/Microsoft\ Teams.app
open /Applications/Sublime\ Text.app;
open /Applications/Todoist.app;

# Open apps I use daily (but need special instructions)
osascript <<EOD
    tell application "Terminal"
        do script "projects"
    end tell
    tell application "Amphetamine"
        start new session with options {duration:$(time_until_eod), interval:minutes, displaySleepAllowed:false}
    end tell
EOD

# Open various dashboards in Chrome
open -a "Google Chrome" "https://merative-my.sharepoint.com/:x:/p/dsebastian/EVFnwnW0BZhAhfTuwMeS49IB3Bg-u-WLPqIrgmuVOQhOHg?e=e7fGKi";
open -a "Google Chrome" "https://merative.monday.com/boards/2802538597/views/65573269";
open -a "Google Chrome" "https://confluence.wh-sdlc.watson-health.ibm.com/display/METL/IHM";
open -a "Google Chrome" "https://jira.wh-sdlc.watson-health.ibm.com/issues/?jql=assignee%20%3D%20\"bbubnick%40merative.com\"%20AND%20status%20not%20in%20(Resolved%2C%20Closed)%20ORDER%20BY%20priority%2C%20updated%20DESC";
