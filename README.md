# THM Workspace Automator 🚀

> One command to set up a TryHackMe room workspace on Kali Linux — directories, `/etc/hosts`, and a fresh terminal, automatically.

[![Shell](https://img.shields.io/badge/shell-bash-green?logo=gnu-bash)](https://www.gnu.org/software/bash/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Kali%20Linux-557C94?logo=kalilinux)](https://www.kali.org/)

## What It Does

Every time you start a TryHackMe machine you repeat the same steps: create a folder, add the IP to `/etc/hosts`, open a terminal in that folder. `thm.sh` does all three in one command and closes the launcher terminal to keep your desktop clean.

| Step | What happens |
|------|-------------|
| **Directory** | Creates `~/tryhackme/<roomname>/` (lowercase, no spaces) |
| **DNS** | Adds `<IP>  <h>.thm` to `/etc/hosts` above the IPv6 block |
| **Dedup** | Removes any existing entry for the same hostname before adding |
| **Terminal** | Spawns a new `qterminal` window inside the workspace and closes the current one |

## Screenshot

<!-- TODO: add a terminal screenshot of `thm "Mr Robot" 10.10.10.10` running here -->
![THM Automator](docs/screenshot.png)

## Prerequisites

- Kali Linux (or any Debian-based distro)
- `qterminal` installed (`sudo apt install qterminal`)
- `sudo` privileges (for `/etc/hosts` writes)

## Installation

```bash
git clone https://github.com/kalialucard/ctf-workspace-setup.git
cd ctf-workspace-setup

chmod +x thm.sh
sudo cp thm.sh /usr/local/bin/thm
```

## Usage

```bash
thm "<Room Name>" <Machine-IP>

# Examples:
thm "Mr Robot CTF" 10.10.10.10
thm "Blue" 10.10.189.44
thm "Agent Sudo" 10.10.1.1
```

What happens:
1. `~/tryhackme/mrrobotctf/` is created
2. `10.10.10.10  m.thm` is added to `/etc/hosts`
3. A new `qterminal` opens in `~/tryhackme/mrrobotctf/`
4. The original terminal closes

## Customisation

Edit `thm.sh` to change the base directory (`~/tryhackme/`), terminal emulator, or hostname suffix (`.thm`).

## License

[MIT](LICENSE) © kalialucard
