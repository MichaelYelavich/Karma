#!/bin/bash

# Check if the script is running as root
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi

# Unmount the file system to perform a clean check
umount /dev/sdaX  # Replace /dev/sdaX with the actual partition you want to check

# Run fsck with the appropriate options
fsck -y /dev/sdaX  # Replace /dev/sdaX with the actual partition you want to check

# Remount the file system after the check
mount /dev/sdaX  # Replace /dev/sdaX with the actual partition you checked

# Print the result of the fsck command
if [[ $? -eq 0 ]]; then
  echo "File system check completed successfully."
else
  echo "File system check failed."
fi
