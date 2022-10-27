#!/bin/bash
# connect to azure resource

open -a "Google Chrome" "https://myapps.microsoft.com/";

echo "Press any key to continue"
while [ true ] ; do
read -t 10 -n 1
if [ $? = 0 ] ; then
break ;
else
echo "waiting for the keypress"
fi
done

#-----------------------------------
# Open various dashboards in Chrome
#-----------------------------------

# 1-on-1
open -a "Google Chrome" "https://merative.monday.com/boards/2802538597/views/65573269";

# Time tracking (manual)
open -a "Google Chrome" "https://merative-my.sharepoint.com/:x:/p/dsebastian/EVFnwnW0BZhAhfTuwMeS49IB3Bg-u-WLPqIrgmuVOQhOHg?e=e7fGKi";

# Time tracking (kantata)
# open -a "Google Chrome" "https://merative.mavenlink.com/users/18737029/dashboard";


#-----------------------------------
# Custom project dashboards
#-----------------------------------

# METL Confluence
# open -a "Google Chrome" "https://confluence.wh-sdlc.watson-health.ibm.com/display/METL/IHM";

# HDP development
# open -a "Google Chrome" "https://jira.wh-sdlc.watson-health.ibm.com/issues/?jql=assignee%20%3D%20\"bbubnick%40merative.com\"%20AND%20status%20not%20in%20(Resolved%2C%20Closed)%20ORDER%20BY%20priority%2C%20updated%20DESC";

# Longitudinal Study
open -a "Google Chrome" "https://merative-my.sharepoint.com/:f:/p/bbubnick/EpFvv-JfGNRDqQwbhLOw6eMBUBdfn7JtUVtwZTYxjAnI9g?e=zDV3BS"

