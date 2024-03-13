#!/bin/bash

# Check if the script is being run with root privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

# The line you want to add after "auth       sufficient     pam_smartcard.so"
line_to_add="auth       sufficient     pam_tid.so"

# Check if the line is already present in the file
if grep -qFx "$line_to_add" /etc/pam.d/sudo; then
    echo "The line is already present in /etc/pam.d/sudo."
    exit 0
fi

# Find the line number of "auth       sufficient     pam_smartcard.so"
line_number=$(grep -n "auth       sufficient     pam_smartcard.so" /etc/pam.d/sudo | cut -d ":" -f 1)

if [ -z "$line_number" ]; then
    echo "Unable to find the line 'auth       sufficient     pam_smartcard.so' in /etc/pam.d/sudo."
    exit 1
fi

# Add the line after the specified line
echo "auth       sufficient     pam_smartcard.so  "${line_number}
#sed -i "${line_number}i${line_to_add}" /etc/pam.d/sudo
awk -v line_number="$line_number" -v line_to_add="$line_to_add" 'NR == line_number + 1 {print line_to_add} 1' /etc/pam.d/sudo > /etc/pam.d/sudo.tmp
mv /etc/pam.d/sudo.tmp /etc/pam.d/sudo
echo "Line added after 'auth       sufficient     pam_smartcard.so' in /etc/pam.d/sudo."
