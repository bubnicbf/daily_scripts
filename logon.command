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
    tell application "Amphetamine"
        start new session with options {duration:$(time_until_eod), interval:minutes, displaySleepAllowed:false}
    end tell
    tell application "Terminal"
        do script "projects"
    end tell
EOD
