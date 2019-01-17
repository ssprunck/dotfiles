#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
NC='\e[39m'

for FILE in $(find ~/dotfiles -name '*.symlink'); do
	# get symlink
	SYMLINK=${FILE##*/}
	
	# get filename
	FILENAME=${SYMLINK%.symlink}

	# backup config file to dotfiles
	if [ -f $FILE ]; then
		cp ~/$FILENAME ~/dotfiles/$SYMLINK
		echo "${GREEN}Copying ~/$FILENAME to ~/dotfiles/$SYMLINK"
	fi
done
