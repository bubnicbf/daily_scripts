#!/bin/bash

# Current directory.
CDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Loop through subdirs only, the final / exclude files.
for repo in $CDIR/*/
do
  echo "Updating" ${repo}
  cd "${repo}"
  # Check if the folder .git exists which
  # means it is a Git repo.
  if [ -d $repo.git ]; then
	  git pull
	  echo -e "Done.\n"
  else
  	echo -e "Not a Git repo.\n"
  fi
done