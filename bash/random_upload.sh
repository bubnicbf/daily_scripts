#!/bin/bash
# upload files at near random intervals

# enter the directory with your document files here
search_dir=/local/directory

for entry in "$search_dir"/*
do
  # wait 3 minutes (180 seconds) plus a few random seconds (up to 30)
  sleep $((180 + (RANDOM % 30)))
  
  # enter the remote directory you upload files to here
  scp "$entry" username@to_host:/remote/directory/
done