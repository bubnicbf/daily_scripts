#!/bin/bash
# convert data either from the file or standard input to lowercase

echo -n "Enter File Name : "
read fileName
 
if [ ! -f $fileName ]; then
  echo "Filename $fileName does not exists"
  exit 1
fi
 
tr '[A-Z]' '[a-z]' < $fileName >> small.txt