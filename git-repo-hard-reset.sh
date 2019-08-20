#! /bin/bash

clear
git status
echo "
Are you sure you want to run a hard reset on this repo?

    Type in 'Yes' to reset to master.
    "
read ch
case $ch in
    Yes)git fetch --all
    git reset --hard origin/master;;
    *)exit;;
esac
