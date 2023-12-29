#!/bin/bash

# Check if there is a local address in the clipboard
CLIPBOARD=$(xclip -selection clipboard -o)

# Extract the file path from the clipboard contents
FILE_PATH=$(echo $CLIPBOARD | sed 's/file:\/\///;s/%20/ /g')

# Check if the file path exists
if [ -e "$FILE_PATH" ]; then
  # Launch Dolphin file manager at the location of the file/directory
  dolphin "$FILE_PATH"
else
  # If the file path does not exist, show an error message
  echo "Invalid file path: $FILE_PATH"
fi

