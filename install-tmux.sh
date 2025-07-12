#!/bin/bash

# =============================================================================
# TMUX INSTALLATION SCRIPT - Optimized for Arch Linux with NerdFonts
# =============================================================================

set -e

echo "🚀 Installing Tmux configuration optimized for Arch Linux with NerdFonts..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
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

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

# Check if running on Arch Linux
if ! command -v pacman &> /dev/null; then
    print_warning "This script is optimized for Arch Linux. Some features may not work on other distributions."
fi

# Check if tmux is installed
if ! command -v tmux &> /dev/null; then
    print_error "Tmux is not installed. Installing tmux..."
    if command -v pacman &> /dev/null; then
        sudo pacman -S --noconfirm tmux
    elif command -v apt-get &> /dev/null; then
        sudo apt-get update && sudo apt-get install -y tmux
    elif command -v yum &> /dev/null; then
        sudo yum install -y tmux
    elif command -v brew &> /dev/null; then
        brew install tmux
    else
        print_error "Please install tmux manually for your distribution."
        exit 1
    fi
fi

print_status "Tmux version: $(tmux -V)"

# Create necessary directories with proper structure
print_header "Creating directories..."

mkdir -p ~/.config/tmux/plugins
mkdir -p ~/.config/tmux/resurrect
mkdir -p ~/.config/tmux/logs
mkdir -p ~/.config/tmux/scripts
mkdir -p ~/.config/tmux/themes

print_success "Directories created successfully"

# Install TPM (Tmux Plugin Manager)
print_header "Installing TPM (Tmux Plugin Manager)..."

if [ ! -d ~/.config/tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
    print_success "TPM installed successfully"
else
    print_status "TPM already installed, updating..."
    cd ~/.config/tmux/plugins/tpm && git pull
fi

# Copy tmux configuration
print_header "Installing Tmux configuration..."

if [ -f ~/.config/tmux/tmux.conf ]; then
    print_warning "~/.config/tmux/tmux.conf already exists. Creating backup..."
    cp ~/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf.backup.$(date +%Y%m%d_%H%M%S)
fi

cp .tmux.conf ~/.config/tmux/tmux.conf
print_success "Tmux configuration installed"

# Install additional tools for plugins
print_header "Installing additional tools..."

# Arch Linux specific packages
if command -v pacman &> /dev/null; then
    print_status "Installing Arch Linux packages..."
    sudo pacman -S --noconfirm xclip upower networkmanager lm_sensors
    print_success "Arch Linux packages installed"
elif command -v apt-get &> /dev/null; then
    # Ubuntu/Debian
    sudo apt-get update
    sudo apt-get install -y xclip upower network-manager lm-sensors
elif command -v yum &> /dev/null; then
    # CentOS/RHEL
    sudo yum install -y xclip upower NetworkManager lm_sensors
elif command -v brew &> /dev/null; then
    # macOS
    brew install tmux
    print_warning "On macOS, you may need to install xclip manually or use pbcopy"
fi

# Create system info scripts
print_header "Creating system info scripts..."

# Battery script with NerdFonts icons
cat > ~/.config/tmux/scripts/battery.sh << 'EOF'
#!/bin/bash

# Battery status for tmux with NerdFonts icons
if command -v upower &> /dev/null; then
    battery=$(upower -i $(upower -e | grep battery) | grep percentage | awk '{print $2}')
    if [[ $battery == *"%"* ]]; then
        echo "$battery"
    else
        echo "N/A"
    fi
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

# System info script
cat > ~/.config/tmux/scripts/sysinfo.sh << 'EOF'
#!/bin/bash

# System load for tmux
if command -v uptime &> /dev/null; then
    load=$(uptime | awk -F'load average:' '{print $2}' | awk '{print $1}' | sed 's/,//')
    echo "$load"
else
    echo "N/A"
fi
EOF

# Network script
cat > ~/.config/tmux/scripts/network.sh << 'EOF'
#!/bin/bash

# Network status for tmux
if command -v nmcli &> /dev/null; then
    connection=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
    if [ -n "$connection" ]; then
        echo "$connection"
    else
        echo "Wired"
    fi
else
    echo "N/A"
fi
EOF

# Disk usage script
cat > ~/.config/tmux/scripts/disk.sh << 'EOF'
#!/bin/bash

# Disk usage for tmux
if command -v df &> /dev/null; then
    usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
    echo "${usage}%"
else
    echo "N/A"
fi
EOF

# Make scripts executable
chmod +x ~/.config/tmux/scripts/*.sh

print_success "System info scripts created"

# Copy advanced themes config
print_header "Installing advanced themes configuration..."
cp tmux-themes.conf ~/.config/tmux/themes/tmux-themes.conf
print_success "Advanced themes configuration installed"

# Create theme switcher script
print_header "Creating theme switcher..."

cat > ~/.config/tmux/scripts/theme-switcher.sh << 'EOF'
#!/bin/bash

# Theme switcher for tmux
THEMES_DIR="$HOME/.config/tmux/themes"
CONFIG_FILE="$HOME/.config/tmux/tmux.conf"

# Available themes
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

# Function to apply theme
apply_theme() {
    local theme=$1
    local theme_file="$THEMES_DIR/tmux-themes.conf"
    
    if [ ! -f "$theme_file" ]; then
        echo "Theme file not found: $theme_file"
        exit 1
    fi
    
    # Extract theme settings from tmux-themes.conf
    local start_line=$(grep -n "THEME: $theme" "$theme_file" | cut -d: -f1)
    if [ -z "$start_line" ]; then
        echo "Theme '$theme' not found"
        exit 1
    fi
    
    local end_line=$(grep -n "THEME:" "$theme_file" | grep -A1 "THEME: $theme" | tail -1 | cut -d: -f1)
    if [ "$end_line" = "$start_line" ]; then
        end_line=$(wc -l < "$theme_file")
    fi
    
    # Apply theme settings
    sed -n "${start_line},${end_line}p" "$theme_file" | grep "set -g @" | while read line; do
        tmux $line
    done
    
    echo "Theme '$theme' applied successfully!"
}

# Function to list themes
list_themes() {
    echo "Available themes:"
    for theme in "${themes[@]}"; do
        echo "  - $theme"
    done
}

# Function to show current theme
show_current() {
    echo "Current theme settings:"
    tmux show -g status-style
    tmux show -g status-left
    tmux show -g status-right
}

# Function to apply random theme
random_theme() {
    local random_theme=${themes[$RANDOM % ${#themes[@]}]}
    echo "Applying random theme: $random_theme"
    apply_theme "$random_theme"
}

# Main script logic
case "${1:-}" in
    "list")
        list_themes
        ;;
    "current")
        show_current
        ;;
    "random")
        random_theme
        ;;
    "")
        echo "Usage: $0 [theme_name|list|current|random]"
        echo ""
        list_themes
        ;;
    *)
        apply_theme "$1"
        ;;
esac
EOF

chmod +x ~/.config/tmux/scripts/theme-switcher.sh

# Create quick reference
print_header "Creating quick reference..."

cat > ~/.config/tmux/quick-ref.md << 'EOF'
# Tmux Quick Reference - Arch Linux Optimized

## Key Bindings

### Prefix
- **Prefix**: `Ctrl+Space` (instead of Ctrl+b)

### Windows
- **New window**: `prefix + c`
- **Kill window**: `prefix + X`
- **Switch to window**: `Ctrl + number` (1-9, 0 for 10)
- **Rename window**: `prefix + ,`

### Panes
- **Split horizontal**: `prefix + s`
- **Split vertical**: `prefix + v`
- **Kill pane**: `prefix + q`
- **Toggle zoom**: `prefix + z`
- **Switch panes**: `Ctrl + arrow keys`
- **Resize panes**: `Ctrl + Shift + arrow keys`

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
- **Theme switcher**: `~/.config/tmux/scripts/theme-switcher.sh`

### Other
- **Reload config**: `prefix + r`
- **Synchronize panes**: `prefix + y`

## Status Bar Information

The status bar shows:
- Session name with NerdFonts icons
- Kernel version
- System load
- Network status
- Disk usage
- Battery status
- Time and date

## Theme Management

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
~/.config/tmux/plugins/tpm/bin/install_plugins
```

### Check NerdFonts
```bash
# Make sure you have a NerdFont installed
fc-list | grep -i nerd
```

## Arch Linux Specific

### Install NerdFonts
```bash
# Install a NerdFont (example with JetBrains Mono)
yay -S nerd-fonts-jetbrains-mono

# Or install multiple NerdFonts
yay -S nerd-fonts-complete
```

### Configure terminal for NerdFonts
Add to your shell profile (~/.bashrc, ~/.zshrc, etc.):
```bash
export TERM="tmux-256color"
```

### Install additional tools
```bash
sudo pacman -S xclip upower networkmanager lm_sensors
```
EOF

print_success "Quick reference created"

# Install plugins
print_header "Installing Tmux plugins..."

# Start a temporary tmux session to install plugins
tmux new-session -d -s temp_session
tmux send-keys -t temp_session "prefix + I" Enter
sleep 5
tmux kill-session -t temp_session

print_success "Plugins installation initiated"

# Create a startup script
print_header "Creating startup script..."

cat > ~/.config/tmux/start.sh << 'EOF'
#!/bin/bash

# Tmux startup script for Arch Linux
echo "🚀 Starting Tmux with Arch Linux optimized configuration..."

# Check if tmux is running
if tmux has-session -t main 2>/dev/null; then
    echo "Attaching to existing session 'main'..."
    tmux attach-session -t main
else
    echo "Creating new session 'main'..."
    tmux new-session -s main
fi
EOF

chmod +x ~/.config/tmux/start.sh

# Create a systemd user service for auto-start
print_header "Creating systemd user service..."

mkdir -p ~/.config/systemd/user

cat > ~/.config/systemd/user/tmux.service << 'EOF'
[Unit]
Description=Tmux session manager
After=network.target

[Service]
Type=forking
ExecStart=/usr/bin/tmux new-session -d -s main
ExecStop=/usr/bin/tmux kill-session -t main
Restart=always
RestartSec=10

[Install]
WantedBy=default.target
EOF

# Enable the service (optional)
# systemctl --user enable tmux.service

print_success "Systemd user service created"

# Final instructions
print_header "Installation Complete! 🎉"

echo ""
print_success "Tmux configuration installed successfully!"
echo ""
echo -e "${BLUE}📋 Next steps:${NC}"
echo "1. Start tmux: tmux"
echo "2. Install plugins: prefix + I (Ctrl+Space, then I)"
echo "3. Reload config: prefix + r"
echo ""
echo -e "${BLUE}🎨 Themes:${NC}"
echo "To use a theme, run: ~/.config/tmux/scripts/theme-switcher.sh"
echo ""
echo -e "${BLUE}📖 Quick reference:${NC}"
echo "View: cat ~/.config/tmux/quick-ref.md"
echo ""
echo -e "${BLUE}🚀 Quick start:${NC}"
echo "Run: ~/.config/tmux/start.sh"
echo ""
echo -e "${YELLOW}💡 Tips:${NC}"
echo "- Use Ctrl+Space as prefix (instead of Ctrl+b)"
echo "- Ctrl+arrow keys to switch panes"
echo "- Ctrl+number to switch windows"
echo "- All keybinds are optimized for Arch Linux"
echo "- NerdFonts icons are used throughout"
echo ""
echo -e "${PURPLE}🔧 Arch Linux specific:${NC}"
echo "- Install NerdFonts: yay -S nerd-fonts-complete"
echo "- Configure terminal: export TERM='tmux-256color'"
echo "- Enable auto-start: systemctl --user enable tmux.service"
echo ""
print_success "Happy coding with Tmux on Arch Linux! 🚀" 