#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
NC='\e[39m'

for FILE in $(find ~/dotfiles -name '*.symlink'); do
	# get filename
	SYMLINK=${FILE##*/}

	# remove '.symlink' from filename
	FILENAME=${SYMLINK%.symlink}

	# create dotfile in home directory
	if ([ -f $FILE ] && ! [ -f ~/$FILENAME ]) || ([ -n "$1" ] && [ "$1" = "--force" ]); then
		cp $FILE ~/$FILENAME
		echo "${GREEN}Copying $FILE to ~/$FILENAME${NC}"
	else
		echo "${RED}Skipping ~/$FILENAME, already exists${NC}"
	fi
done
