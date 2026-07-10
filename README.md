# dotfiles

Personal dotfiles for an Arch Linux + Hyprland (Wayland) desktop. Managed with
[GNU Stow](https://www.gnu.org/software/stow/) - each top-level directory is a
"package" that mirrors the layout of `$HOME` and gets symlinked into place.

## Contents

| Package      | What it configures                          |
|--------------|----------------------------------------------|
| `hypr`       | Hyprland window manager, hyprlock, hypridle  |
| `waybar`     | Status bar                                   |
| `kitty`      | Terminal emulator                            |
| `tofi`       | Application launcher                         |
| `wlogout`    | Logout/power menu                            |
| `dunst`      | Notifications                                |
| `thunar`     | File manager custom actions/keybindings      |
| `nwg-look`   | GTK theme switcher config                    |
| `gtk-3.0`    | GTK 3 settings                               |
| `gtk-4.0`    | GTK 4 settings                               |
| `xsettingsd` | X settings daemon                            |
| `xfce4`      | Thunar xfconf preferences                    |
| `misc`       | `mimeapps.list` (default applications)       |

## Installation

```bash
git clone git@github.com:<you>/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow hypr waybar kitty tofi wlogout dunst thunar nwg-look \
     gtk-3.0 gtk-4.0 xsettingsd xfce4 misc
```

Re-run `stow <package>` any time you add a new one. To remove a package's
symlinks, use `stow -D <package>`.

## Not tracked here (intentionally)

- **`~/.config/BraveSoftware`** - browser profile, cache, cookies, extension
  data. Machine-specific and potentially sensitive.
- **`~/.config/pulse/cookie`** - PulseAudio auth cookie.
- **`~/.config/dconf/user`** - binary GNOME/GTK settings database.
- **`~/.config/go/telemetry`** - Go toolchain telemetry state, regenerated
  automatically.
- **`~/.config/gtk-4.0/assets/`** - theme-provided assets, not authored here.
- **`~/.config/gtk-4.0/gtk.css`** and **`gtk-dark.css`** - symlinks provided
  by the **Catppuccin-Mocha** GTK theme package, not regular files. Install
  the theme and select it via `nwg-look` to regenerate them.

## Requirements

- `stow`
- Catppuccin-Mocha GTK theme (for `gtk-4.0/gtk.css` / `gtk-dark.css`)
