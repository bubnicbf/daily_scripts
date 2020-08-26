#!/bin/sh
#
# Requires kumar_asshole script in your bin
#

# scans the inbox for emails from "Kumar" (a DBA at our clients). 
# Looks for keywords like "help", "trouble", "sorry" etc. 
# If keywords are found - the script SSHes into the clients server 
# and rolls back the staging database to the latest backup. 
# Then sends a reply "no worries mate, be careful next time".

exec kumar_asshole
