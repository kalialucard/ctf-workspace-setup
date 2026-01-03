#!/bin/zsh

# 1. Validation
if [ "$#" -ne 2 ]; then
    echo "Usage: thm <IP> <Room Name>"
    return 1 
fi

IP=$1
ROOM_NAME=$2

# 2. Formatting
# Directory: No spaces, all lowercase (e.g., "Hacking Fun" -> "hackingfun")
DIR_NAME=$(echo "$ROOM_NAME" | tr -d '[:space:]' | tr '[:upper:]' '[:lower:]')

# Hostname: First letter of dir name + .thm (e.g., "h.thm")
FIRST_LETTER=$(echo "$DIR_NAME" | cut -c1)
HOSTNAME="${FIRST_LETTER}.thm"

BASE_DIR="/home/kali/tryhackme"
TARGET_DIR="$BASE_DIR/$DIR_NAME"

# 3. Create Workspace
mkdir -p "$TARGET_DIR"

# 4. Update /etc/hosts Cleanly
# Remove old entry if it exists to prevent duplicates
sudo sed -i "/$HOSTNAME/d" /etc/hosts
# Insert new IP before IPv6 section (looks for ::1)
sudo sed -i "/::1/i $IP $HOSTNAME" /etc/hosts

echo "[*] Host: $HOSTNAME | Dir: $DIR_NAME"

# 5. Launch New Terminal (Detached)
# nohup allows the new window to survive when we kill the old one
nohup qterminal --workdir "$TARGET_DIR" >/dev/null 2>&1 &!

# 6. KILL THE OLD TERMINAL
# Waits 1 second to ensure new window is ready
sleep 1
# Kills the Parent Process (your current window) instantly.
kill -9 $PPID
