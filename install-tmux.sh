#!/bin/bash

# =============================================================================
# TMUX INSTALLATION SCRIPT - Optimized for Neovim VimX
# =============================================================================

set -e

echo "🚀 Installing Tmux configuration optimized for Neovim VimX..."

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

# Check if running on Windows
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    print_warning "Detected Windows environment. Some features may not work as expected."
    print_warning "Consider using WSL2 for the best experience."
fi

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    print_error "Tmux is not installed. Please install tmux first:"
    echo ""
    echo "Ubuntu/Debian: sudo apt install tmux"
    echo "macOS: brew install tmux"
    echo "Windows: choco install tmux"
    echo "Arch: sudo pacman -S tmux"
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

# Copy tmux configuration
print_header "Installing Tmux configuration..."

if [ -f ~/.tmux.conf ]; then
    print_warning "~/.tmux.conf already exists. Creating backup..."
    cp ~/.tmux.conf ~/.tmux.conf.backup.$(date +%Y%m%d_%H%M%S)
fi

# Copy the configuration file
cp .tmux.conf ~/.tmux.conf
print_status "Tmux configuration installed"

# Install additional tools for plugins
print_header "Installing additional tools..."

# Check and install xclip (for copy/paste functionality)
if command -v apt-get &> /dev/null; then
    # Ubuntu/Debian
    sudo apt-get update
    sudo apt-get install -y xclip tmux
elif command -v yum &> /dev/null; then
    # CentOS/RHEL
    sudo yum install -y xclip tmux
elif command -v pacman &> /dev/null; then
    # Arch Linux
    sudo pacman -S --noconfirm xclip tmux
elif command -v brew &> /dev/null; then
    # macOS
    brew install tmux
    print_warning "On macOS, you may need to install xclip manually or use pbcopy"
elif command -v choco &> /dev/null; then
    # Windows Chocolatey
    choco install tmux
    print_warning "On Windows, copy/paste functionality may be limited"
fi

# Create a simple battery script for status bar
print_header "Creating battery script..."

cat > ~/.tmux/battery.sh << 'EOF'
#!/bin/bash

# Simple battery status for tmux
if command -v upower &> /dev/null; then
    battery=$(upower -i $(upower -e | grep battery) | grep percentage | awk '{print $2}')
    echo "$battery"
elif command -v pmset &> /dev/null; then
    battery=$(pmset -g batt | grep -o "[0-9]*%" | head -1)
    echo "$battery"
elif [ -f /sys/class/power_supply/BAT0/capacity ]; then
    battery=$(cat /sys/class/power_supply/BAT0/capacity)
    echo "${battery}%"
else
    echo "N/A"
fi
EOF

chmod +x ~/.tmux/battery.sh

# Create theme switcher script
print_header "Creating theme switcher..."

cat > ~/.tmux/theme-switcher.sh << 'EOF'
#!/bin/bash

# Tmux theme switcher
themes=(
    "default"
    "catppuccin"
    "dracula"
    "gruvbox"
    "nord"
    "tokyo-night"
    "material"
    "one-dark"
    "solarized"
    "monokai"
)

current_theme=$(tmux show-option -gqv @theme 2>/dev/null || echo "default")

# Function to apply theme
apply_theme() {
    local theme=$1
    case $theme in
        "catppuccin")
            tmux set -g status-style bg=colour240,fg=colour223
            tmux set -g window-status-current-style bg=colour136,fg=colour235
            ;;
        "dracula")
            tmux set -g status-style bg=colour53,fg=colour255
            tmux set -g window-status-current-style bg=colour141,fg=colour53
            ;;
        "gruvbox")
            tmux set -g status-style bg=colour237,fg=colour223
            tmux set -g window-status-current-style bg=colour214,fg=colour237
            ;;
        "nord")
            tmux set -g status-style bg=colour240,fg=colour255
            tmux set -g window-status-current-style bg=colour109,fg=colour240
            ;;
        "tokyo-night")
            tmux set -g status-style bg=colour235,fg=colour136
            tmux set -g window-status-current-style bg=colour136,fg=colour235
            ;;
        "material")
            tmux set -g status-style bg=colour238,fg=colour255
            tmux set -g window-status-current-style bg=colour33,fg=colour238
            ;;
        "one-dark")
            tmux set -g status-style bg=colour235,fg=colour188
            tmux set -g window-status-current-style bg=colour33,fg=colour235
            ;;
        "solarized")
            tmux set -g status-style bg=colour254,fg=colour66
            tmux set -g window-status-current-style bg=colour33,fg=colour254
            ;;
        "monokai")
            tmux set -g status-style bg=colour52,fg=colour255
            tmux set -g window-status-current-style bg=colour197,fg=colour52
            ;;
        *)
            tmux set -g status-style bg=colour235,fg=colour136,default
            tmux set -g window-status-current-style bg=colour136,fg=colour235
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
read -p "Select theme (1-${#themes[@]}): " choice

if [[ $choice =~ ^[0-9]+$ ]] && [ $choice -ge 1 ] && [ $choice -le ${#themes[@]} ]; then
    selected_theme=${themes[$((choice-1))]}
    apply_theme "$selected_theme"
    echo "Theme changed to: $selected_theme"
else
    echo "Invalid selection"
fi
EOF

chmod +x ~/.tmux/theme-switcher.sh

# Create quick reference
print_header "Creating quick reference..."

cat > ~/.tmux/quick-ref.md << 'EOF'
# Tmux Quick Reference

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
- Kernel version
- System load
- Battery status
- Time and date

## Integration with Neovim VimX

This configuration is optimized to work seamlessly with your Neovim VimX setup:
- Uses `Ctrl+Space` as prefix to avoid conflicts
- Alt-based navigation that doesn't interfere with Neovim
- Session persistence that works with Neovim sessions
- Copy/paste integration with system clipboard

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
EOF

print_status "Quick reference created at ~/.tmux/quick-ref.md"

# Install plugins
print_header "Installing Tmux plugins..."

# Start a temporary tmux session to install plugins
tmux new-session -d -s temp_session
tmux send-keys -t temp_session "prefix + I" Enter
sleep 5
tmux kill-session -t temp_session

print_status "Plugins installation initiated"

# Create a startup script
print_header "Creating startup script..."

cat > ~/.tmux/start.sh << 'EOF'
#!/bin/bash

# Tmux startup script
echo "Starting Tmux with VimX-optimized configuration..."

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
echo -e "${GREEN}✅ Tmux configuration installed successfully!${NC}"
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
echo -e "${YELLOW}💡 Tips:${NC}"
echo "- Use Ctrl+Space as prefix (instead of Ctrl+b)"
echo "- Alt+arrow keys to switch panes"
echo "- Alt+number to switch windows"
echo "- All keybinds are optimized for Neovim VimX compatibility"
echo ""
echo -e "${GREEN}Happy coding with Tmux + Neovim VimX! 🚀${NC}" 