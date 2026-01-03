# THM Workspace Automator 🚀

A streamlined automation script for Kali Linux designed to speed up the setup process for TryHackMe (THM) rooms. 

Instead of manually creating directories and editing `/etc/hosts` every time you start a new machine, this script does it all in one command—and then drops you directly into a new terminal window inside your workspace.

## ✨ Features

* **Smart Directory Creation:** Automatically creates a workspace directory in `~/tryhackme/`.
    * Converts names to **lowercase**.
    * Removes **spaces** (e.g., "Hacking Fun" -> `hackingfun`).
* **Automated DNS:** Adds the room IP to `/etc/hosts`.
    * Generates a short hostname based on the first letter (e.g., `h.thm`).
    * **Clean Injection:** Inserts the IP *above* the IPv6 section to keep your hosts file organized.
* **Seamless Transition:**
    * Opens a new `qterminal` window directly in the new folder.
    * **Auto-Close:** Immediately closes the original terminal window to keep your desktop clean.

## 📋 Prerequisites

* **OS:** Kali Linux (or any distro using Zsh).
* **Terminal:** `qterminal` (Default in modern Kali XFCE).
* **Shell:** Zsh.

## 🛠️ Installation

### 1. Download the Script
Clone this repo or download `thm.sh` to your home directory:

```bash
cd ~
git clone [https://github.com/YOUR_USERNAME/thm-automator.git](https://github.com/YOUR_USERNAME/thm-automator.git)
cp thm-automator/thm.sh .
