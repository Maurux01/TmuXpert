#!/bin/bash

# =============================================================================
# TMUX INSTALLATION SCRIPT FOR WSL2 - Optimized for Neovim VimX
# =============================================================================

set -e

echo "🚀 Installing Tmux configuration optimized for Neovim VimX on WSL2..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================${NC}"
}

# Check if running on WSL2
if ! grep -q Microsoft /proc/version 2>/dev/null; then
    print_warning "This script is designed for WSL2. Some features may not work optimally on other systems."
fi

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    print_error "Tmux is not installed. Please install tmux first:"
    echo ""
    echo "Ubuntu/Debian: sudo apt install tmux"
    echo "Arch: sudo pacman -S tmux"
    echo "Fedora: sudo dnf install tmux"
    exit 1
fi

print_status "Tmux version: $(tmux -V)"

# Create necessary directories
print_header "Creating directories..."

mkdir -p ~/.tmux/plugins
mkdir -p ~/.tmux/resurrect
mkdir -p ~/.tmux/logs

print_status "Directories created successfully"

# Install TPM (Tmux Plugin Manager)
print_header "Installing TPM (Tmux Plugin Manager)..."

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    print_status "TPM installed successfully"
else
    print_status "TPM already installed, updating..."
    cd ~/.tmux/plugins/tpm && git pull
fi

# Copy tmux configuration for WSL2
print_header "Installing Tmux configuration for WSL2..."

if [ -f ~/.tmux.conf ]; then
    print_warning "~/.tmux.conf already exists. Creating backup..."
    cp ~/.tmux.conf ~/.tmux.conf.backup.$(date +%Y%m%d_%H%M%S)
fi

# Copy the WSL2 configuration file
cp .tmux.conf.wsl ~/.tmux.conf
print_status "Tmux configuration for WSL2 installed"

# Install additional tools for plugins
print_header "Installing additional tools..."

# Check and install required packages
if command -v apt-get &> /dev/null; then
    # Ubuntu/Debian
    sudo apt-get update
    sudo apt-get install -y xclip tmux git curl
elif command -v pacman &> /dev/null; then
    # Arch Linux
    sudo pacman -S --noconfirm xclip tmux git curl
elif command -v dnf &> /dev/null; then
    # Fedora
    sudo dnf install -y xclip tmux git curl
fi

# Create a battery script for WSL2
print_header "Creating battery script for WSL2..."

cat > ~/.tmux/battery.sh << 'EOF'
#!/bin/bash

# Simple battery status for tmux on WSL2
if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    echo "${battery}%"
else
    echo "N/A"
fi
EOF

chmod +x ~/.tmux/battery.sh

# Create theme switcher script for WSL2
print_header "Creating theme switcher for WSL2..."

cat > ~/.tmux/theme-switcher.sh << 'EOF'
#!/bin/bash

# Tmux theme switcher for WSL2
themes=(
    "tokyo-night"
    "catppuccin"
    "dracula"
    "gruvbox"
    "nord"
    "material"
    "one-dark"
    "solarized"
    "monokai"
    "rose-pine"
    "kanagawa"
    "everforest"
    "doom-one"
    "carbonfox"
    "oxocarbon"
    "melange"
    "modus-vivendi"
    "vim-one"
    "papercolor"
)

current_theme=$(tmux show-option -gqv @theme 2>/dev/null || echo "default")

# Function to apply theme
apply_theme() {
    local theme=$1
    case $theme in
        "tokyo-night")
            tmux set -g status-style "bg=colour235,fg=colour136"
            tmux set -g window-status-current-style "bg=colour136,fg=colour235"
            ;;
        "catppuccin")
            tmux set -g status-style "bg=colour240,fg=colour223"
            tmux set -g window-status-current-style "bg=colour136,fg=colour235"
            ;;
        "dracula")
            tmux set -g status-style "bg=colour53,fg=colour255"
            tmux set -g window-status-current-style "bg=colour141,fg=colour53"
            ;;
        "gruvbox")
            tmux set -g status-style "bg=colour237,fg=colour223"
            tmux set -g window-status-current-style "bg=colour214,fg=colour237"
            ;;
        "nord")
            tmux set -g status-style "bg=colour240,fg=colour255"
            tmux set -g window-status-current-style "bg=colour109,fg=colour240"
            ;;
        "material")
            tmux set -g status-style "bg=colour238,fg=colour255"
            tmux set -g window-status-current-style "bg=colour33,fg=colour238"
            ;;
        "one-dark")
            tmux set -g status-style "bg=colour235,fg=colour188"
            tmux set -g window-status-current-style "bg=colour33,fg=colour235"
            ;;
        "solarized")
            tmux set -g status-style "bg=colour254,fg=colour66"
            tmux set -g window-status-current-style "bg=colour33,fg=colour254"
            ;;
        "monokai")
            tmux set -g status-style "bg=colour52,fg=colour255"
            tmux set -g window-status-current-style "bg=colour197,fg=colour52"
            ;;
        "rose-pine")
            tmux set -g status-style "bg=colour235,fg=colour223"
            tmux set -g window-status-current-style "bg=colour168,fg=colour235"
            ;;
        "kanagawa")
            tmux set -g status-style "bg=colour234,fg=colour223"
            tmux set -g window-status-current-style "bg=colour180,fg=colour234"
            ;;
        "everforest")
            tmux set -g status-style "bg=colour235,fg=colour223"
            tmux set -g window-status-current-style "bg=colour142,fg=colour235"
            ;;
        "doom-one")
            tmux set -g status-style "bg=colour235,fg=colour188"
            tmux set -g window-status-current-style "bg=colour88,fg=colour235"
            ;;
        "carbonfox")
            tmux set -g status-style "bg=colour233,fg=colour255"
            tmux set -g window-status-current-style "bg=colour33,fg=colour233"
            ;;
        "oxocarbon")
            tmux set -g status-style "bg=colour233,fg=colour255"
            tmux set -g window-status-current-style "bg=colour39,fg=colour233"
            ;;
        "melange")
            tmux set -g status-style "bg=colour235,fg=colour223"
            tmux set -g window-status-current-style "bg=colour180,fg=colour235"
            ;;
        "modus-vivendi")
            tmux set -g status-style "bg=colour0,fg=colour255"
            tmux set -g window-status-current-style "bg=colour51,fg=colour0"
            ;;
        "vim-one")
            tmux set -g status-style "bg=colour235,fg=colour188"
            tmux set -g window-status-current-style "bg=colour33,fg=colour235"
            ;;
        "papercolor")
            tmux set -g status-style "bg=colour254,fg=colour66"
            tmux set -g window-status-current-style "bg=colour33,fg=colour254"
            ;;
        *)
            tmux set -g status-style "bg=colour235,fg=colour136,default"
            tmux set -g window-status-current-style "bg=colour136,fg=colour235"
            ;;
    esac
    tmux set -g @theme $theme
}

# Show theme menu
echo "Available themes:"
for i in "${!themes[@]}"; do
    if [ "${themes[$i]}" = "$current_theme" ]; then
        echo "  $((i+1)). ${themes[$i]} (current)"
    else
        echo "  $((i+1)). ${themes[$i]}"
    fi
done

echo ""
read -p "Select theme (1-${#themes[@]}) or 'q' to quit: " choice

if [ "$choice" = "q" ] || [ "$choice" = "quit" ]; then
    print_status "Exiting..."
    exit 0
fi

if [[ $choice =~ ^[0-9]+$ ]] && [ $choice -ge 1 ] && [ $choice -le ${#themes[@]} ]; then
    selected_theme=${themes[$((choice-1))]}
    apply_theme "$selected_theme"
    echo "Theme changed to: $selected_theme"
else
    echo "Invalid selection"
fi
EOF

chmod +x ~/.tmux/theme-switcher.sh

# Create quick reference for WSL2
print_header "Creating quick reference for WSL2..."

cat > ~/.tmux/quick-ref.md << 'EOF'
# Tmux Quick Reference for WSL2

## Key Bindings

### Prefix
- **Prefix**: `Ctrl+Space` (instead of Ctrl+b)

### Windows
- **New window**: `prefix + c`
- **Kill window**: `prefix + X`
- **Switch to window**: `Alt + number` (1-9, 0 for 10)
- **Rename window**: `prefix + ,`

### Panes
- **Split horizontal**: `prefix + |`
- **Split vertical**: `prefix + -`
- **Kill pane**: `prefix + x`
- **Toggle zoom**: `prefix + z`
- **Switch panes**: `Alt + arrow keys`
- **Resize panes**: `Alt + Shift + arrow keys`

### Sessions
- **Save session**: `prefix + S`
- **Restore session**: `prefix + R`
- **Kill session**: `prefix + Ctrl+f`
- **Switch session**: `prefix + Ctrl+s`

### Copy Mode
- **Enter copy mode**: `prefix + [`
- **Search backward**: `prefix + /`
- **Search forward**: `prefix + ?`
- **Copy selection**: `Enter` (in copy mode)

### Plugins
- **Fingers (URL/file detection)**: `prefix + F`
- **URL view**: `prefix + u`
- **Theme switcher**: `~/.tmux/theme-switcher.sh`

### Other
- **Reload config**: `prefix + r`
- **Synchronize panes**: `prefix + y`

## Status Bar Information

The status bar shows:
- Session name
- WSL2 indicator
- System load
- Battery status (if available)
- Time and date

## Integration with Neovim VimX

This configuration is optimized to work seamlessly with your Neovim VimX setup:
- Uses `Ctrl+Space` as prefix to avoid conflicts
- Alt-based navigation that doesn't interfere with Neovim
- Session persistence that works with Neovim sessions
- Copy/paste integration with Windows clipboard via clip.exe

## WSL2 Specific Features

- **Clipboard integration**: Uses `clip.exe` for Windows clipboard
- **Battery status**: Reads from `/sys/class/power_supply/BAT0/capacity`
- **System load**: Uses `/proc/loadavg`
- **Path compatibility**: Optimized for Linux paths in WSL2

## Troubleshooting

### Plugins not loading
```bash
prefix + I  # Install plugins
```

### Reload configuration
```bash
prefix + r  # Reload tmux.conf
```

### Check tmux version
```bash
tmux -V
```

### Manual plugin installation
```bash
~/.tmux/plugins/tpm/bin/install_plugins
```

### Clipboard issues
```bash
# Test clipboard
echo "test" | clip.exe
```
EOF

print_status "Quick reference created at ~/.tmux/quick-ref.md"

# Create startup script for WSL2
print_header "Creating startup script for WSL2..."

cat > ~/.tmux/start.sh << 'EOF'
#!/bin/bash

# Tmux startup script for WSL2
echo "Starting Tmux with VimX-optimized configuration on WSL2..."

# Check if tmux is running
if tmux has-session -t main 2>/dev/null; then
    echo "Attaching to existing session 'main'..."
    tmux attach-session -t main
else
    echo "Creating new session 'main'..."
    tmux new-session -s main
fi
EOF

chmod +x ~/.tmux/start.sh

# Final instructions
print_header "Installation Complete! 🎉"

echo ""
echo -e "${GREEN}✅ Tmux configuration for WSL2 installed successfully!${NC}"
echo ""
echo -e "${BLUE}📋 Next steps:${NC}"
echo "1. Start tmux: tmux"
echo "2. Install plugins: prefix + I (Ctrl+Space, then I)"
echo "3. Reload config: prefix + r"
echo ""
echo -e "${BLUE}🎨 Available themes:${NC}"
echo "Run: ~/.tmux/theme-switcher.sh"
echo ""
echo -e "${BLUE}📖 Quick reference:${NC}"
echo "View: cat ~/.tmux/quick-ref.md"
echo ""
echo -e "${BLUE}🚀 Quick start:${NC}"
echo "Run: ~/.tmux/start.sh"
echo ""
echo -e "${YELLOW}💡 WSL2 Tips:${NC}"
echo "- Use Ctrl+Space as prefix (instead of Ctrl+b)"
echo "- Alt+arrow keys to switch panes"
echo "- Alt+number to switch windows"
echo "- Copy/paste works with Windows clipboard via clip.exe"
echo "- All keybinds are optimized for Neovim VimX compatibility"
echo ""
echo -e "${GREEN}Happy coding with Tmux + Neovim VimX on WSL2! 🚀${NC}"
</rewritten_file> 