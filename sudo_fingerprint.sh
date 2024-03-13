#!/bin/bash

# Check if the script is being run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

# The line you want to add to /etc/pam.d/sudo
line_to_add="auth       sufficient     pam_tid.so"

# Check if the line is already present in the file
if grep -qFx "$line_to_add" /etc/pam.d/sudo; then
    echo "The line is already present in /etc/pam.d/sudo."
    exit 0
fi

# Append the line to /etc/pam.d/sudo
echo "$line_to_add" >> /etc/pam.d/sudo
echo "Line added to /etc/pam.d/sudo."
