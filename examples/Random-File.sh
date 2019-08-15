#!/bin/bash
# create unique file/folder automatically with date and time stamp

echo "Hello $USER";
echo "$(uptime)" >> "$(date)".txt
echo "Your File is being saved to $(pwd)"
