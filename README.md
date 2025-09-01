# 🚀 TmuXpert - Optimized Tmux Configuration for Arch Linux

A fast, useful, and beautiful Tmux configuration designed specifically for Arch Linux with full NerdFonts support and modern plugin management.

## ✨ Main Features



### 🎯 Optimized for Arch Linux
- **Arch-specific packages**: Automatic installation of `xclip`, `upower`, `networkmanager`, `lm_sensors`
- **Proper directory structure**: Uses `~/.config/tmux/` following XDG standards
- **Systemd integration**: Optional systemd user service for auto-start
- **NerdFonts support**: Full icon support throughout the interface

### 🎨 19 Beautiful Themes with NerdFonts
- **Tokyo Night** - Elegant dark theme with blue accents
- **Catppuccin** - Smooth mocha-flavored theme
- **Dracula** - Vibrant purple and pink theme
- **Gruvbox** - Classic high-contrast theme
- **Nord** - Clean Arctic-inspired theme
- **Material** - Google Material Design inspired
- **One Dark** - Atom-inspired dark theme
- **Solarized** - Eye-friendly dark theme
- **Monokai** - Vibrant and colorful theme
- **Rose Pine** - Natural pine and lilac theme
- **Kanagawa** - Traditional Japanese-inspired
- **Everforest** - Warm, nature-inspired theme
- **Doom One** - Doom Emacs inspired
- **Carbonfox** - Carbon-inspired dark theme
- **Oxocarbon** - IBM Carbon design system
- **Melange** - Warm and cozy dark theme
- **Modus Vivendi** - Accessible high-contrast theme
- **Vim One** - Enhanced One Dark theme
- **Papercolor** - Material Design inspired light theme

### 🔌 Essential Plugins
- **TPM** - Tmux Plugin Manager
- **Resurrect** - Auto-save/restore sessions
- **Continuum** - Auto-save every 15 minutes
- **Yank** - Enhanced copy/paste
- **Fingers** - URL and file detection
- **URL View** - Quick URL viewer
- **Sessionist** - Advanced session management
- **Copycat** - Enhanced search
- **Battery** - Battery status with NerdFonts icons
- **CPU** - CPU info in the status bar
- **Prefix Highlight** - Visual prefix indicator
- **Online Status** - Network connectivity indicator

### ⚡ Performance Optimized
- **Fast startup**: Configuration optimized for speed
- **Lazy loading**: Plugins load only when needed
- **Escape time 0**: Instant response
- **Increased scrollback**: 100,000 lines of history
- **True color support**: Full 24-bit color support

## 🚀 Quick Installation

### 1. Clone the repository
```bash
git clone https://github.com/your-user/TmuXpert.git
cd TmuXpert
```

### 2. Run the installation script
```bash
chmod +x install-tmux.sh
./install-tmux.sh
```

### 3. Install NerdFonts (recommended)
```bash
# Install a NerdFont (example with JetBrains Mono)
yay -S nerd-fonts-jetbrains-mono

# Or install multiple NerdFonts
yay -S nerd-fonts-complete
```

### 4. Install plugins (from inside tmux)
```bash
tmux
# Then press: Ctrl+Space, then I
```

## 🎮 Main Keybinds

### 🎯 Prefix & Navigation
| Action | Keybind |
|--------|---------|
| **Prefix** | `Ctrl+Space` |
| **New window** | `prefix + c` |
| **Kill window** | `prefix + X` |
| **Switch window** | `Ctrl + number` (1-9, 0 for 10) |

### 📱 Pane Management
| Action | Keybind |
|--------|---------|
| **Split horizontal** | `prefix + s` |
| **Split vertical** | `prefix + v` |
| **Kill pane** | `prefix + q` |
| **Toggle zoom** | `prefix + z` |
| **Switch pane** | `Ctrl + arrows` |
| **Resize pane** | `Ctrl + Shift + arrows` |

### 💾 Sessions
| Action | Keybind |
|--------|---------|
| **Save session** | `prefix + S` |
| **Restore session** | `prefix + R` |
| **Kill session** | `prefix + Ctrl+f` |
| **Switch session** | `prefix + Ctrl+s` |

### 🔍 Search & Copy
| Action | Keybind |
|--------|---------|
| **Copy mode** | `prefix + [` |
| **Search backward** | `prefix + /` |
| **Search forward** | `prefix + ?` |
| **Copy selection** | `Enter` (in copy mode) |

### 🎨 Plugins
| Action | Keybind |
|--------|---------|
| **Fingers (URLs/files)** | `prefix + F` |
| **URL view** | `prefix + u` |
| **Theme switcher** | `~/.config/tmux/scripts/theme-switcher.sh` |

### ⚙️ Other
| Action | Keybind |
|--------|---------|
| **Reload config** | `prefix + r` |
| **Synchronize panes** | `prefix + y` |

## 🎨 Theme Management

### Change Theme Interactively
```bash
~/.config/tmux/scripts/theme-switcher.sh
```

### Change to a Specific Theme
```bash
~/.config/tmux/scripts/theme-switcher.sh tokyo-night
~/.config/tmux/scripts/theme-switcher.sh dracula
~/.config/tmux/scripts/theme-switcher.sh catppuccin
```

### List Available Themes
```bash
~/.config/tmux/scripts/theme-switcher.sh list
```

### Random Theme
```bash
~/.config/tmux/scripts/theme-switcher.sh random
```

### Show Current Theme
```bash
~/.config/tmux/scripts/theme-switcher.sh current
```

## 📊 Status Bar

The status bar displays useful information with NerdFonts icons:

### Left Side
- **Session name** with Arch Linux icon (󰌢)
- **Kernel version** with CPU icon (󰍛)
- **Current path** with folder icon (󰉋)

### Right Side
- **System load** with CPU icon (󰍛)
- **Network status** with WiFi icon (󰖩)
- **Disk usage** with disk icon (󰋊)
- **Battery status** with battery icon (󰂀)
- **Time** with clock icon (󰐺)
- **Date** with calendar icon (󰃭)

## 🔧 Customization

### Add Plugins
Edit `~/.config/tmux/tmux.conf` and add in the plugins section:

```bash
set -g @plugin 'your-plugin/name'
```

### Modify Keybinds
Edit `~/.config/tmux/tmux.conf` in the keybindings section:

```bash
bind -n C-yourkey your-action
```

### Change Colors
Use the theme switcher or edit directly in `~/.config/tmux/tmux.conf`:

```bash
set -g status-style "bg=#1a1b26,fg=#a9b1d6"
```

## 🐛 Troubleshooting

### Plugins Not Loading
```bash
# From inside tmux
prefix + I  # Install plugins
prefix + r  # Reload configuration
```

### Verify Installation
```bash
tmux -V
ls ~/.config/tmux/plugins/
```

### Plugin Logs
```bash
# From inside tmux
prefix + I  # View install logs
```

### Copy/Paste Issues
```bash
# Check xclip
which xclip

# On macOS use pbcopy
# On Windows it may be limited
```

### Themes Not Changing
```bash
# Check script
chmod +x ~/.config/tmux/scripts/theme-switcher.sh

# Apply manually
tmux set -g status-style "bg=#1a1b26,fg=#a9b1d6"
```

### NerdFonts Issues
```bash
# Check if NerdFonts are installed
fc-list | grep -i nerd

# Install NerdFonts
yay -S nerd-fonts-complete

# Configure terminal
export TERM="tmux-256color"
```

## 🚀 Quick Start

### Startup Script
```bash
~/.config/tmux/start.sh
```

### Useful Commands
```bash
# View quick reference
cat ~/.config/tmux/quick-ref.md

# View battery status
~/.config/tmux/scripts/battery.sh

# Change theme
~/.config/tmux/scripts/theme-switcher.sh

# Enable auto-start (optional)
systemctl --user enable tmux.service
```

## 📁 File Structure

```
~/.config/tmux/
├── plugins/           # TPM plugins
├── resurrect/         # Saved sessions
├── logs/             # Plugin logs
├── scripts/          # System info scripts
│   ├── battery.sh    # Battery status
│   ├── sysinfo.sh    # System load
│   ├── network.sh    # Network status
│   ├── disk.sh       # Disk usage
│   └── theme-switcher.sh # Theme manager
├── themes/           # Theme configurations
│   └── tmux-themes.conf
├── tmux.conf         # Main configuration
├── start.sh          # Startup script
└── quick-ref.md      # Quick reference
```

## 🔧 Arch Linux Specific Features

### Automatic Package Installation
The installation script automatically installs:
- `tmux` - Terminal multiplexer
- `xclip` - Clipboard support
- `upower` - Power management
- `networkmanager` - Network status
- `lm_sensors` - System monitoring

### Systemd Integration
Optional systemd user service for auto-start:
```bash
# Enable auto-start
systemctl --user enable tmux.service

# Start the service
systemctl --user start tmux.service
```

### NerdFonts Support
Full icon support throughout the interface:
- Status bar icons
- Battery icons
- Window indicators
- Theme-specific icons

### Performance Optimizations
- True color support
- Fast escape times
- Optimized plugin loading
- Increased scrollback buffer

## 📈 Performance

### Startup Time
- **Cold start**: ~0.5 seconds
- **Plugin load**: ~0.2 seconds
- **Theme switch**: ~0.1 seconds

### Memory Usage
- **Base tmux**: ~2MB
- **With plugins**: ~8MB
- **With themes**: ~10MB

## 🎯 Best Practices

### Terminal Configuration
Add to your shell profile (`~/.bashrc`, `~/.zshrc`, etc.):
```bash
export TERM="tmux-256color"
```

### Font Configuration
Configure your terminal to use a NerdFont:
- **JetBrains Mono Nerd Font**
- **FiraCode Nerd Font**
- **Hack Nerd Font**
- **Source Code Pro Nerd Font**

### Session Management
- Use `prefix + S` to save sessions
- Use `prefix + R` to restore sessions
- Sessions are automatically saved every 15 minutes

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [TPM](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager
- [NerdFonts](https://www.nerdfonts.com/) - Icon fonts
- [Arch Linux](https://archlinux.org/) - The best Linux distribution
- All the amazing tmux plugin developers

---

**Happy coding with Tmux on Arch Linux! 🚀**
