#!/bin/bash

for FILE in $(find . -name '*.symlink'); do
	# get filename
	FILENAME=${FILE##*/}

	# remove '.symlink' from filename
	FILENAME=$(echo "$FILENAME" | cut -f 1 -d '.')

	# create dotfile in home directory
    if [ ! -d "$FILENAME" ] && [ ! -f "$FILENAME" ]; then
    	cp -R $FILE ~/.$FILENAME
    else
        echo "File / Directory $FILENAME exists"
    fi
done
