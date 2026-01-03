# 🚀 THM Workspace Automator

A streamlined automation script for Kali Linux designed to speed up the setup process for TryHackMe (THM) rooms.

Instead of manually creating directories and editing `/etc/hosts` every time you start a new machine, this script does it all in one command—and then drops you directly into a new terminal window inside your workspace.

## ✨ Features

* **Smart Directory Creation:** Automatically creates a workspace directory in `~/tryhackme/`.
    * Converts names to **lowercase**.
    * Removes **spaces** (e.g., "Hacking Fun" -> `hackingfun`).
* **Automated DNS:** Adds the room IP to `/etc/hosts`.
    * Generates a short hostname based on the first letter (e.g., `h.thm`).
    * **Clean Injection:** Inserts the IP *above* the IPv6 section (`::1`) to keep your hosts file organized.
    * **No Duplicates:** Automatically removes old entries for the same hostname before adding the new one.
* **Seamless Transition:**
    * Opens a new `qterminal` window directly in the new folder.
    * **Auto-Close:** Immediately kills the original terminal window to keep your desktop clean.

## 📋 Prerequisites

* **OS:** Kali Linux (or any distro using Zsh).
* **Terminal:** `qterminal` (Default in modern Kali XFCE).
* **Shell:** Zsh.

## 🛠️ Installation

### 1. Create the Script
Create a file named `thm.sh` in your home directory:

nano ~/thm.sh


Configure the Alias (Crucial!)

For the Auto-Close feature to work, the script must be run using source so it can access the parent process ID.

    Open your Zsh config:
    Bash

nano ~/.zshrc

Add this line to the bottom:
Bash

alias thm='source /home/kali/thm.sh'

Save and reload:
Bash

    source ~/.zshrc

🚀 Usage

Run the command followed by the Machine IP and the Room Name.
Bash

thm <IP_ADDRESS> <ROOM_NAME>

Example

You start a room called "Hacking Fun" with IP 10.10.20.5.
Bash

thm 10.10.20.5 "Hacking Fun"

What happens:

    You are prompted for sudo password (to edit /etc/hosts).

    Directory created: /home/kali/tryhackme/hackingfun/.

    Host entry added: 10.10.20.5 h.thm (placed neatly above IPv6 lines).

    Magic: Your current terminal vanishes, and a new one opens ready to go inside the hackingfun folder.
