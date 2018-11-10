#!/bin/bash

for FILE in $(find . -name '*.symlink'); do
	# get filename
	FILENAME=${FILE##*/}

	# remove '.symlink' from filename
	FILENAME=$(echo "$FILENAME" | cut -f 1 -d '.')

	# create dotfile in home directory
	cp -R $FILE ~/.$FILENAME
done
