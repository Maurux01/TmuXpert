# 🚀 TmuXpert - Optimized Tmux Configuration for Neovim VimX

A fast, useful, and beautiful Tmux configuration designed to work perfectly with your Neovim VimX setup.

## ✨ Main Features

### 🎯 Optimized for Neovim VimX
- **Non-conflicting prefix**: `Ctrl+Space` instead of `Ctrl+b`
- **Smart keybinds**: Alt-based navigation that doesn't interfere with Neovim
- **Seamless integration**: Session persistence compatible with Neovim
- **Enhanced copy/paste**: Integrated with the system clipboard

### 🎨 19 Beautiful Themes
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
- **Battery** - Battery status in the status bar
- **CPU** - CPU info in the status bar

### ⚡ Performance Optimized
- **Fast startup**: Configuration optimized for speed
- **Lazy loading**: Plugins load only when needed
- **Escape time 0**: Instant response
- **Increased scrollback**: 50,000 lines of history

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

### 3. Install plugins (from inside tmux)
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
| **Switch window** | `Alt + number` (1-9, 0 for 10) |

### 📱 Pane Management
| Action | Keybind |
|--------|---------|
| **Split horizontal** | `prefix + |` |
| **Split vertical** | `prefix + -` |
| **Kill pane** | `prefix + x` |
| **Toggle zoom** | `prefix + z` |
| **Switch pane** | `Alt + arrows` |
| **Resize pane** | `Alt + Shift + arrows` |

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
| **Theme switcher** | `~/.tmux/theme-switcher.sh` |

### ⚙️ Other
| Action | Keybind |
|--------|---------|
| **Reload config** | `prefix + r` |
| **Synchronize panes** | `prefix + y` |

## 🎨 Theme Management

### Change Theme Interactively
```bash
~/.tmux/theme-switcher.sh
```

### Change to a Specific Theme
```bash
~/.tmux/theme-switcher.sh tokyo-night
~/.tmux/theme-switcher.sh dracula
~/.tmux/theme-switcher.sh catppuccin
```

### List Available Themes
```bash
~/.tmux/theme-switcher.sh list
```

### Random Theme
```bash
~/.tmux/theme-switcher.sh random
```

### Show Current Theme
```bash
~/.tmux/theme-switcher.sh current
```

## 📊 Status Bar

The status bar displays useful information:

### Left Side
- **Session name**
- **Kernel version**
- **Current path**

### Right Side
- **System load**
- **Battery status**
- **Time and date**

## 🔧 Customization

### Add Plugins
Edit `~/.tmux.conf` and add in the plugins section:

```bash
set -g @plugin 'your-plugin/name'
```

### Modify Keybinds
Edit `~/.tmux.conf` in the keybindings section:

```bash
bind -n M-yourkey your-action
```

### Change Colors
Use the theme switcher or edit directly in `~/.tmux.conf`:

```bash
set -g status-style "bg=colour235,fg=colour136"
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
ls ~/.tmux/plugins/
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
chmod +x ~/.tmux/theme-switcher.sh

# Apply manually
tmux set -g status-style "bg=colour235,fg=colour136"
```

## 🚀 Quick Start

### Startup Script
```bash
~/.tmux/start.sh
```

### Useful Commands
```bash
# View quick reference
cat ~/.tmux/quick-ref.md

# View battery status
~/.tmux/battery.sh

# Change theme
~/.tmux/theme-switcher.sh
```

## 📁 File Structure

```
~/.tmux/
├── plugins/           # TPM plugins
├── resurrect/         # Saved sessions
├── logs/              # System logs
├── battery.sh         # Battery script
├── theme-switcher.sh  # Theme manager
├── start.sh           # Startup script
└── quick-ref.md       # Quick reference

~/.tmux.conf           # Main configuration
```

## 🎯 Integration with Neovim VimX

This configuration is designed to work perfectly with your Neovim VimX:

### Compatibility
- **Non-conflicting prefix**: `Ctrl+Space` does not interfere with Neovim
- **Alt-based navigation**: Does not affect Neovim keybinds
- **Session persistence**: Works with Neovim sessions
- **Copy/paste**: Perfect integration with clipboard

### Recommended Workflow
1. **Start Tmux**: `tmux` or `~/.tmux/start.sh`
2. **Open Neovim**: `nvim` in a pane
3. **Navigate**: Use `Alt+arrows` to switch panes
4. **Switch windows**: Use `Alt+number` for windows
5. **Change theme**: `~/.tmux/theme-switcher.sh`

## 🤝 Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a branch for your feature
3. Commit your changes
4. Push to your branch
5. Open a Pull Request

## 📄 License

This project is under the MIT license. See `LICENSE` for details.

## 🙏 Credits

- **LazyVim** - Base for the Neovim configuration
- **TPM** - Tmux Plugin Manager
- **Tmux Community** - Plugins and themes

## 🔗 Useful Links

- [Neovim VimX](https://github.com/Maurux01/VimX) - Your Neovim configuration
- [TPM](https://github.com/tmux-plugins/tpm) - Plugin manager
- [Tmux Manual](https://man.openbsd.org/tmux.1) - Official documentation

---

**Enjoy your new Tmux configuration optimized for Neovim VimX! 🚀**