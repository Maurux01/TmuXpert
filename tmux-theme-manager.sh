#!/bin/bash

# =============================================================================
# TMUX THEME MANAGER - Advanced Theme Switcher
# =============================================================================

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

print_theme() {
    echo -e "${PURPLE}$1${NC}"
}

# Check if tmux is running
if ! tmux info &> /dev/null; then
    print_error "Tmux is not running. Please start tmux first."
    exit 1
fi

# Define all available themes with descriptions
declare -A themes=(
    ["tokyo-night"]="Elegant dark theme with blue accents"
    ["catppuccin"]="Smooth mocha-flavored theme"
    ["dracula"]="Vibrant purple and pink theme"
    ["gruvbox"]="Classic high-contrast theme"
    ["nord"]="Clean Arctic-inspired theme"
    ["material"]="Google Material Design inspired"
    ["one-dark"]="Atom-inspired dark theme"
    ["solarized"]="Eye-friendly dark theme"
    ["monokai"]="Vibrant and colorful theme"
    ["rose-pine"]="Natural pine and lilac theme"
    ["kanagawa"]="Traditional Japanese-inspired"
    ["everforest"]="Nature-inspired warm theme"
    ["doom-one"]="Doom Emacs inspired theme"
    ["carbonfox"]="Carbon-inspired dark theme"
    ["oxocarbon"]="IBM Carbon design system"
    ["melange"]="Warm and cozy dark theme"
    ["modus-vivendi"]="High-contrast accessible theme"
    ["vim-one"]="Enhanced One Dark theme"
    ["papercolor"]="Material Design inspired light theme"
)

# Function to apply a theme
apply_theme() {
    local theme=$1
    
    case $theme in
        "tokyo-night")
            tmux set -g status-style "bg=colour235,fg=colour136"
            tmux set -g window-status-current-style "bg=colour136,fg=colour235"
            tmux set -g status-left "#[fg=colour136,bg=colour235,bold] #S #[fg=colour235,bg=colour240,nobold] #[fg=colour235,bg=colour240] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour235,bg=colour240] %H:%M #[fg=colour235,bg=colour136] %d-%b #[fg=colour136,bg=colour235] #(battery -t) #[default]"
            ;;
        "catppuccin")
            tmux set -g status-style "bg=colour240,fg=colour223"
            tmux set -g window-status-current-style "bg=colour136,fg=colour235"
            tmux set -g status-left "#[fg=colour223,bg=colour240,bold] #S #[fg=colour240,bg=colour238,nobold] #[fg=colour240,bg=colour238] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour240,bg=colour238] %H:%M #[fg=colour240,bg=colour136] %d-%b #[fg=colour136,bg=colour240] #(battery -t) #[default]"
            ;;
        "dracula")
            tmux set -g status-style "bg=colour53,fg=colour255"
            tmux set -g window-status-current-style "bg=colour141,fg=colour53"
            tmux set -g status-left "#[fg=colour255,bg=colour53,bold] #S #[fg=colour53,bg=colour55,nobold] #[fg=colour53,bg=colour55] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour53,bg=colour55] %H:%M #[fg=colour53,bg=colour141] %d-%b #[fg=colour141,bg=colour53] #(battery -t) #[default]"
            ;;
        "gruvbox")
            tmux set -g status-style "bg=colour237,fg=colour223"
            tmux set -g window-status-current-style "bg=colour214,fg=colour237"
            tmux set -g status-left "#[fg=colour223,bg=colour237,bold] #S #[fg=colour237,bg=colour239,nobold] #[fg=colour237,bg=colour239] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour237,bg=colour239] %H:%M #[fg=colour237,bg=colour214] %d-%b #[fg=colour214,bg=colour237] #(battery -t) #[default]"
            ;;
        "nord")
            tmux set -g status-style "bg=colour240,fg=colour255"
            tmux set -g window-status-current-style "bg=colour109,fg=colour240"
            tmux set -g status-left "#[fg=colour255,bg=colour240,bold] #S #[fg=colour240,bg=colour242,nobold] #[fg=colour240,bg=colour242] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour240,bg=colour242] %H:%M #[fg=colour240,bg=colour109] %d-%b #[fg=colour109,bg=colour240] #(battery -t) #[default]"
            ;;
        "material")
            tmux set -g status-style "bg=colour238,fg=colour255"
            tmux set -g window-status-current-style "bg=colour33,fg=colour238"
            tmux set -g status-left "#[fg=colour255,bg=colour238,bold] #S #[fg=colour238,bg=colour240,nobold] #[fg=colour238,bg=colour240] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour238,bg=colour240] %H:%M #[fg=colour238,bg=colour33] %d-%b #[fg=colour33,bg=colour238] #(battery -t) #[default]"
            ;;
        "one-dark")
            tmux set -g status-style "bg=colour235,fg=colour188"
            tmux set -g window-status-current-style "bg=colour33,fg=colour235"
            tmux set -g status-left "#[fg=colour188,bg=colour235,bold] #S #[fg=colour235,bg=colour237,nobold] #[fg=colour235,bg=colour237] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour235,bg=colour237] %H:%M #[fg=colour235,bg=colour33] %d-%b #[fg=colour33,bg=colour235] #(battery -t) #[default]"
            ;;
        "solarized")
            tmux set -g status-style "bg=colour254,fg=colour66"
            tmux set -g window-status-current-style "bg=colour33,fg=colour254"
            tmux set -g status-left "#[fg=colour66,bg=colour254,bold] #S #[fg=colour254,bg=colour253,nobold] #[fg=colour254,bg=colour253] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour254,bg=colour253] %H:%M #[fg=colour254,bg=colour33] %d-%b #[fg=colour33,bg=colour254] #(battery -t) #[default]"
            ;;
        "monokai")
            tmux set -g status-style "bg=colour52,fg=colour255"
            tmux set -g window-status-current-style "bg=colour197,fg=colour52"
            tmux set -g status-left "#[fg=colour255,bg=colour52,bold] #S #[fg=colour52,bg=colour88,nobold] #[fg=colour52,bg=colour88] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour52,bg=colour88] %H:%M #[fg=colour52,bg=colour197] %d-%b #[fg=colour197,bg=colour52] #(battery -t) #[default]"
            ;;
        "rose-pine")
            tmux set -g status-style "bg=colour235,fg=colour223"
            tmux set -g window-status-current-style "bg=colour168,fg=colour235"
            tmux set -g status-left "#[fg=colour223,bg=colour235,bold] #S #[fg=colour235,bg=colour237,nobold] #[fg=colour235,bg=colour237] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour235,bg=colour237] %H:%M #[fg=colour235,bg=colour168] %d-%b #[fg=colour168,bg=colour235] #(battery -t) #[default]"
            ;;
        "kanagawa")
            tmux set -g status-style "bg=colour234,fg=colour223"
            tmux set -g window-status-current-style "bg=colour180,fg=colour234"
            tmux set -g status-left "#[fg=colour223,bg=colour234,bold] #S #[fg=colour234,bg=colour236,nobold] #[fg=colour234,bg=colour236] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour234,bg=colour236] %H:%M #[fg=colour234,bg=colour180] %d-%b #[fg=colour180,bg=colour234] #(battery -t) #[default]"
            ;;
        "everforest")
            tmux set -g status-style "bg=colour235,fg=colour223"
            tmux set -g window-status-current-style "bg=colour142,fg=colour235"
            tmux set -g status-left "#[fg=colour223,bg=colour235,bold] #S #[fg=colour235,bg=colour237,nobold] #[fg=colour235,bg=colour237] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour235,bg=colour237] %H:%M #[fg=colour235,bg=colour142] %d-%b #[fg=colour142,bg=colour235] #(battery -t) #[default]"
            ;;
        "doom-one")
            tmux set -g status-style "bg=colour235,fg=colour188"
            tmux set -g window-status-current-style "bg=colour88,fg=colour235"
            tmux set -g status-left "#[fg=colour188,bg=colour235,bold] #S #[fg=colour235,bg=colour237,nobold] #[fg=colour235,bg=colour237] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour235,bg=colour237] %H:%M #[fg=colour235,bg=colour88] %d-%b #[fg=colour88,bg=colour235] #(battery -t) #[default]"
            ;;
        "carbonfox")
            tmux set -g status-style "bg=colour233,fg=colour255"
            tmux set -g window-status-current-style "bg=colour33,fg=colour233"
            tmux set -g status-left "#[fg=colour255,bg=colour233,bold] #S #[fg=colour233,bg=colour235,nobold] #[fg=colour233,bg=colour235] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour233,bg=colour235] %H:%M #[fg=colour233,bg=colour33] %d-%b #[fg=colour33,bg=colour233] #(battery -t) #[default]"
            ;;
        "oxocarbon")
            tmux set -g status-style "bg=colour233,fg=colour255"
            tmux set -g window-status-current-style "bg=colour39,fg=colour233"
            tmux set -g status-left "#[fg=colour255,bg=colour233,bold] #S #[fg=colour233,bg=colour235,nobold] #[fg=colour233,bg=colour235] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour233,bg=colour235] %H:%M #[fg=colour233,bg=colour39] %d-%b #[fg=colour39,bg=colour233] #(battery -t) #[default]"
            ;;
        "melange")
            tmux set -g status-style "bg=colour235,fg=colour223"
            tmux set -g window-status-current-style "bg=colour180,fg=colour235"
            tmux set -g status-left "#[fg=colour223,bg=colour235,bold] #S #[fg=colour235,bg=colour237,nobold] #[fg=colour235,bg=colour237] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour235,bg=colour237] %H:%M #[fg=colour235,bg=colour180] %d-%b #[fg=colour180,bg=colour235] #(battery -t) #[default]"
            ;;
        "modus-vivendi")
            tmux set -g status-style "bg=colour0,fg=colour255"
            tmux set -g window-status-current-style "bg=colour51,fg=colour0"
            tmux set -g status-left "#[fg=colour255,bg=colour0,bold] #S #[fg=colour0,bg=colour8,nobold] #[fg=colour0,bg=colour8] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour0,bg=colour8] %H:%M #[fg=colour0,bg=colour51] %d-%b #[fg=colour51,bg=colour0] #(battery -t) #[default]"
            ;;
        "vim-one")
            tmux set -g status-style "bg=colour235,fg=colour188"
            tmux set -g window-status-current-style "bg=colour33,fg=colour235"
            tmux set -g status-left "#[fg=colour188,bg=colour235,bold] #S #[fg=colour235,bg=colour237,nobold] #[fg=colour235,bg=colour237] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour235,bg=colour237] %H:%M #[fg=colour235,bg=colour33] %d-%b #[fg=colour33,bg=colour235] #(battery -t) #[default]"
            ;;
        "papercolor")
            tmux set -g status-style "bg=colour254,fg=colour66"
            tmux set -g window-status-current-style "bg=colour33,fg=colour254"
            tmux set -g status-left "#[fg=colour66,bg=colour254,bold] #S #[fg=colour254,bg=colour253,nobold] #[fg=colour254,bg=colour253] #{pane_current_path} #[default]"
            tmux set -g status-right "#[fg=colour254,bg=colour253] %H:%M #[fg=colour254,bg=colour33] %d-%b #[fg=colour33,bg=colour254] #(battery -t) #[default]"
            ;;
        *)
            print_error "Unknown theme: $theme"
            return 1
            ;;
    esac
    
    # Save the theme preference
    tmux set -g @theme $theme
    print_status "Theme '$theme' applied successfully!"
}

# Function to show current theme
show_current_theme() {
    local current_theme=$(tmux show-option -gqv @theme 2>/dev/null || echo "default")
    print_status "Current theme: $current_theme"
}

# Function to list all themes
list_themes() {
    print_header "Available Themes"
    echo ""
    
    local current_theme=$(tmux show-option -gqv @theme 2>/dev/null || echo "default")
    local i=1
    
    for theme in "${!themes[@]}"; do
        if [ "$theme" = "$current_theme" ]; then
            echo -e "  ${CYAN}$i.${NC} ${PURPLE}$theme${NC} ${GREEN}(current)${NC}"
            echo -e "     ${YELLOW}${themes[$theme]}${NC}"
        else
            echo -e "  ${CYAN}$i.${NC} ${PURPLE}$theme${NC}"
            echo -e "     ${YELLOW}${themes[$theme]}${NC}"
        fi
        echo ""
        ((i++))
    done
}

# Function to show theme preview (simple color blocks)
show_theme_preview() {
    local theme=$1
    print_header "Theme Preview: $theme"
    echo ""
    
    case $theme in
        "tokyo-night")
            echo -e "${BLUE}████████████████████████████████${NC}"
            echo -e "${BLUE}████████████████████████████████${NC}"
            echo -e "${YELLOW}████████████████████████████████${NC}"
            ;;
        "catppuccin")
            echo -e "${PURPLE}████████████████████████████████${NC}"
            echo -e "${PURPLE}████████████████████████████████${NC}"
            echo -e "${YELLOW}████████████████████████████████${NC}"
            ;;
        "dracula")
            echo -e "${PURPLE}████████████████████████████████${NC}"
            echo -e "${PURPLE}████████████████████████████████${NC}"
            echo -e "${CYAN}████████████████████████████████${NC}"
            ;;
        "gruvbox")
            echo -e "${YELLOW}████████████████████████████████${NC}"
            echo -e "${YELLOW}████████████████████████████████${NC}"
            echo -e "${RED}████████████████████████████████${NC}"
            ;;
        "nord")
            echo -e "${BLUE}████████████████████████████████${NC}"
            echo -e "${BLUE}████████████████████████████████${NC}"
            echo -e "${CYAN}████████████████████████████████${NC}"
            ;;
        *)
            echo -e "${GREEN}████████████████████████████████${NC}"
            echo -e "${GREEN}████████████████████████████████${NC}"
            echo -e "${BLUE}████████████████████████████████${NC}"
            ;;
    esac
    echo ""
}

# Main script logic
case "${1:-}" in
    "list"|"ls")
        list_themes
        ;;
    "current"|"cur")
        show_current_theme
        ;;
    "preview")
        if [ -z "$2" ]; then
            print_error "Please specify a theme to preview"
            echo "Usage: $0 preview <theme-name>"
            exit 1
        fi
        show_theme_preview "$2"
        ;;
    "random"|"rand")
        # Get a random theme
        themes_array=($(printf '%s\n' "${!themes[@]}" | shuf))
        random_theme=${themes_array[0]}
        print_status "Applying random theme: $random_theme"
        apply_theme "$random_theme"
        ;;
    "help"|"-h"|"--help")
        print_header "Tmux Theme Manager"
        echo ""
        echo "Usage: $0 [COMMAND] [THEME]"
        echo ""
        echo "Commands:"
        echo "  list, ls              List all available themes"
        echo "  current, cur          Show current theme"
        echo "  preview <theme>       Show theme preview"
        echo "  random, rand          Apply random theme"
        echo "  <theme-name>          Apply specific theme"
        echo "  help, -h, --help      Show this help"
        echo ""
        echo "Examples:"
        echo "  $0 list"
        echo "  $0 tokyo-night"
        echo "  $0 preview dracula"
        echo "  $0 random"
        echo ""
        ;;
    "")
        # No arguments - show interactive menu
        print_header "Tmux Theme Manager"
        echo ""
        list_themes
        echo ""
        read -p "Select theme (1-${#themes[@]}) or 'q' to quit: " choice
        
        if [ "$choice" = "q" ] || [ "$choice" = "quit" ]; then
            print_status "Exiting..."
            exit 0
        fi
        
        if [[ $choice =~ ^[0-9]+$ ]] && [ $choice -ge 1 ] && [ $choice -le ${#themes[@]} ]; then
            themes_array=($(printf '%s\n' "${!themes[@]}" | sort))
            selected_theme=${themes_array[$((choice-1))]}
            apply_theme "$selected_theme"
        else
            print_error "Invalid selection"
            exit 1
        fi
        ;;
    *)
        # Apply specific theme
        if [[ -n "${themes[$1]}" ]]; then
            apply_theme "$1"
        else
            print_error "Unknown theme: $1"
            echo ""
            echo "Available themes:"
            printf '%s\n' "${!themes[@]}" | sort
            exit 1
        fi
        ;;
esac 