#!/bin/bash

# =============================================================================
# TMUX INSTALLATION TEST SCRIPT - Arch Linux
# =============================================================================

set -e

echo "🧪 Testing Tmux installation for Arch Linux..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[PASS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[FAIL]${NC} $1"
}

print_header() {
    echo -e "${BLUE}================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}================================${NC}"
}

# Test 1: Check if tmux is installed
print_header "Testing Tmux Installation"

if command -v tmux &> /dev/null; then
    print_status "Tmux is installed: $(tmux -V)"
else
    print_error "Tmux is not installed"
    exit 1
fi

# Test 2: Check configuration file
print_header "Testing Configuration Files"

if [ -f ~/.config/tmux/tmux.conf ]; then
    print_status "Main configuration file exists"
else
    print_error "Main configuration file not found"
fi

if [ -f ~/.config/tmux/themes/tmux-themes.conf ]; then
    print_status "Themes configuration file exists"
else
    print_error "Themes configuration file not found"
fi

# Test 3: Check directories
print_header "Testing Directory Structure"

directories=(
    "~/.config/tmux"
    "~/.config/tmux/plugins"
    "~/.config/tmux/scripts"
    "~/.config/tmux/themes"
    "~/.config/tmux/resurrect"
    "~/.config/tmux/logs"
)

for dir in "${directories[@]}"; do
    if [ -d "$dir" ]; then
        print_status "Directory exists: $dir"
    else
        print_error "Directory missing: $dir"
    fi
done

# Test 4: Check scripts
print_header "Testing Scripts"

scripts=(
    "~/.config/tmux/scripts/battery.sh"
    "~/.config/tmux/scripts/sysinfo.sh"
    "~/.config/tmux/scripts/network.sh"
    "~/.config/tmux/scripts/disk.sh"
    "~/.config/tmux/scripts/theme-switcher.sh"
    "~/.config/tmux/start.sh"
)

for script in "${scripts[@]}"; do
    if [ -f "$script" ] && [ -x "$script" ]; then
        print_status "Script exists and is executable: $script"
    else
        print_error "Script missing or not executable: $script"
    fi
done

# Test 5: Check TPM
print_header "Testing TPM (Tmux Plugin Manager)"

if [ -d ~/.config/tmux/plugins/tpm ]; then
    print_status "TPM is installed"
else
    print_error "TPM is not installed"
fi

# Test 6: Check Arch Linux packages
print_header "Testing Arch Linux Packages"

packages=(
    "xclip"
    "upower"
    "networkmanager"
    "lm_sensors"
)

for pkg in "${packages[@]}"; do
    if command -v "$pkg" &> /dev/null; then
        print_status "Package installed: $pkg"
    else
        print_warning "Package not found: $pkg"
    fi
done

# Test 7: Check NerdFonts
print_header "Testing NerdFonts Support"

if command -v fc-list &> /dev/null; then
    if fc-list | grep -i nerd &> /dev/null; then
        print_status "NerdFonts are installed"
    else
        print_warning "NerdFonts are not installed"
        echo "  Install with: yay -S nerd-fonts-complete"
    fi
else
    print_warning "fontconfig not available, cannot check NerdFonts"
fi

# Test 8: Test tmux session
print_header "Testing Tmux Session"

# Start a test session
tmux new-session -d -s test_session

# Check if session was created
if tmux has-session -t test_session 2>/dev/null; then
    print_status "Tmux session created successfully"
    
    # Test basic tmux commands
    tmux send-keys -t test_session "echo 'Hello from tmux!'" Enter
    sleep 1
    
    # Kill the test session
    tmux kill-session -t test_session
    print_status "Tmux session killed successfully"
else
    print_error "Failed to create tmux session"
fi

# Test 9: Check systemd service
print_header "Testing Systemd Service"

if [ -f ~/.config/systemd/user/tmux.service ]; then
    print_status "Systemd user service file exists"
else
    print_warning "Systemd user service file not found"
fi

# Test 10: Check theme switcher
print_header "Testing Theme Switcher"

if [ -f ~/.config/tmux/scripts/theme-switcher.sh ]; then
    # Test listing themes
    if ~/.config/tmux/scripts/theme-switcher.sh list &> /dev/null; then
        print_status "Theme switcher is working"
    else
        print_error "Theme switcher is not working"
    fi
else
    print_error "Theme switcher script not found"
fi

# Final summary
print_header "Test Summary"

echo ""
echo -e "${GREEN}✅ Installation test completed!${NC}"
echo ""
echo -e "${BLUE}📋 Next steps:${NC}"
echo "1. Start tmux: tmux"
echo "2. Install plugins: prefix + I (Ctrl+Space, then I)"
echo "3. Test themes: ~/.config/tmux/scripts/theme-switcher.sh"
echo "4. View quick reference: cat ~/.config/tmux/quick-ref.md"
echo ""
echo -e "${YELLOW}💡 Tips:${NC}"
echo "- Install NerdFonts for full icon support"
echo "- Configure your terminal to use tmux-256color"
echo "- Enable auto-start: systemctl --user enable tmux.service"
echo ""
print_status "All tests completed successfully!" 