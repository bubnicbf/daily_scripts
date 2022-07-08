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
    playlistlist[0]="37i9dQZF1E39hBTio44x3B"
    playlistlist[1]="37i9dQZF1E35TbUW8AyH92"
    playlistlist[2]="37i9dQZF1E351NFGzFy1ar"
    playlistlist[3]="37i9dQZF1E38cwp812py2i"
    playlistlist[4]="37i9dQZF1DWYoYGBbGKurt"
    playlistlist[5]="37i9dQZF1DX0SM0LYsmbMT"
    playlistlist[6]="37i9dQZF1DXaf6XmhwlgC6"
    playlistlist[7]="37i9dQZF1E38S1a4SY2jsZ"

    size=${#playlistlist[@]}
    index=$(($RANDOM % $size))
    echo ${playlistlist[$index]}
}

# Open various dashboards in Chrome
open -a "Google Chrome" "https://merative-my.sharepoint.com/:x:/p/dsebastian/EVFnwnW0BZhAhfTuwMeS49IB3Bg-u-WLPqIrgmuVOQhOHg?e=e7fGKi";
open -a "Google Chrome" "https://merative.monday.com/boards/2802538597/views/65573269";

# Open apps I use daily
open /Applications/Microsoft\ Teams.app
open /Applications/Sublime\ Text.app;
open /Applications/Todoist.app;
open /Applications/Microsoft\ Outlook.app;

# Open apps I use daily (but need special instructions)
osascript <<EOD
    tell application "Terminal"
        do script "projects"
    end tell
    tell application "Amphetamine"
        start new session with options {duration:$(time_until_eod), interval:minutes, displaySleepAllowed:false}
    end tell
EOD

# Open this one last
open /Applications/Cisco/Cisco\ AnyConnect\ Secure\ Mobility\ Client.app;
source ~/projects/chunichi_dragons/nagoya.properties; echo -n $ADP | pbcopy;
