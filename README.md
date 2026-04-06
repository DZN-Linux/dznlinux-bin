# DZNLinux Bin

A collection of utility scripts and terminal fun for DZN Linux, installed to `~/.bin/` via `/etc/skel`. Includes a custom system fetch, sysinfo display, ASCII art scripts, and system maintenance helpers.

## Features

- Custom `fetch` script — colorized system info display (packages, uptime, resolution, WM, CPU, GPU, memory)
- `sysinfo` script — compact system overview with GTK theme info
- ASCII art and color test scripts for terminal customization
- System helpers: samba setup, swapfile resize, makepkg optimization, key signing
- Compatible with KDE Plasma 6.6 on both X11 and Wayland

## Compatibility

- **Desktop Environments**: KDE Plasma 6.6 (primary), Xfce, GNOME, and others
- **Display Server**: X11 and Wayland
- **Distribution**: Arch Linux and Arch-based distributions

## Installation

### From DZN Linux Repository (Recommended)

First, add the DZN Linux repository to your system:

```bash
# Add the PGP key
sudo pacman-key --recv-key BB31837564255477
sudo pacman-key --lsign-key BB31837564255477
```

Add the following to `/etc/pacman.conf`:

```ini
[dznlinux_repo]
SigLevel = Required DatabaseOptional
Server = https://repo.dozzen.me/archlinux/$repo/$arch

[dznlinux_repo_3party]
SigLevel = Required DatabaseOptional
Server = https://repo.dozzen.me/archlinux/$repo/$arch
```

Then install the package:

```bash
sudo pacman -Sy
sudo pacman -S dznlinux-bin-git
```

### Manual Installation

```bash
# Clone this repository
git clone https://github.com/DZN-Linux/dznlinux-bin.git

# Copy scripts to user's .bin directory
cp -r dznlinux-bin/etc/skel/.bin ~/.bin

# Make all scripts executable
chmod +x ~/.bin/* 2>/dev/null || true
find ~/.bin/main -name "*.sh" -exec chmod +x {} \;
```

Add `~/.bin` to your `PATH` in `~/.bashrc` or `~/.zshrc` if it is not already present:

```bash
export PATH="$HOME/.bin:$PATH"
```

## Scripts

### fetch

Displays a colorized system summary in the terminal:

```bash
fetch
```

Output includes: OS, packages, uptime, resolution, WM/compositor, shell, terminal, kernel, CPU, GPU, and memory. Wayland-aware — uses `kscreen-doctor` or `wlr-randr` for resolution on Wayland sessions.

### sysinfo

Compact system info with GTK theme details:

```bash
sysinfo
```

### System Helpers (`~/.bin/main/`)

| Script | Purpose |
|--------|---------|
| `000-use-all-cores-makepkg-conf-v4.sh` | Configure makepkg to use all CPU cores |
| `fixes/change-name-of-bibata-cursor.sh` | Rename Bibata cursor theme directory |
| `fixes/fix-pamac-aur-no-icons.sh` | Fix missing icons in Pamac AUR results |
| `fixes/make-bluetooth-systemicon-visible-again.sh` | Restore Bluetooth system tray icon (DE-aware) |
| `keys/smdlinux-signing-key.sh` | Install DZN Linux repository signing key |
| `samba/1-install-samba-v3.sh` | Install and configure Samba |
| `samba/2-install-network-discovery-v4.sh` | Enable Avahi/mDNS network discovery |
| `samba/3-install-samba-user-shares-for-every-desktop-v1.sh` | Add file manager share integration |
| `swapfile/change-the-size-of-your-current-swapfile.sh` | Resize existing swapfile interactively |

## File Structure

```
etc/skel/.bin/
├── fetch                  # System info fetch script
├── sysinfo                # Compact sysinfo display
├── colortest              # ANSI color palette test
├── colortest-slim         # Slim color test
├── colorview              # Grid color display
├── colorwheel             # Color wheel pattern
├── bonsai-tree            # Animated bonsai tree
├── [other ASCII art]      # darthvader, dna, starwars, etc.
└── main/
    ├── 000-use-all-cores-makepkg-conf-v4.sh
    ├── fixes/
    ├── keys/
    ├── samba/
    └── swapfile/
```

## License

Licensed under the GNU General Public License v3.0 or later (GPL-3.0-or-later).

See [LICENSE](LICENSE) file for details.

## Credits

- `fetch` script based on work by Erik Dubois, Brad Heffernan, and Dylan Araps (neofetch)
- `sysinfo` script based on work by Morgareth99, adapted by Erik Dubois for ArcoLinux
- DZN Linux adaptation: Seth Dawson

## Links

- GitHub: https://github.com/DZN-Linux/dznlinux-bin
- DZN Linux: https://github.com/DZN-Linux

## Troubleshooting

### fetch shows "none" for resolution on Wayland

Install `kscreen` (KDE) or `wlr-randr` (wlroots compositors):

```bash
sudo pacman -S kscreen        # KDE Plasma
sudo pacman -S wlr-randr      # Sway, Hyprland, etc.
```

### sysinfo shows "Unknown" for keyboard layout

Ensure `systemd` is installed and `localectl` is available:

```bash
localectl status
```

### Bluetooth icon fix does nothing on KDE

On KDE Plasma 6.6, manage the Bluetooth tray icon via **System Settings → System Tray Settings** — enable the Bluetooth entry. The `make-bluetooth-systemicon-visible-again.sh` script targets non-KDE desktops using the Blueberry applet.

### Scripts not found after manual install

Confirm `~/.bin` is in your `PATH`:

```bash
echo $PATH | grep -o "$HOME/.bin"
```

If missing, add `export PATH="$HOME/.bin:$PATH"` to your shell rc file and re-login.
