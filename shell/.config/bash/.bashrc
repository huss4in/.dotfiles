#
# ~/.bashrc
#

# Load aliases
[ -f "$HOME/.config/bash/.aliases" ] && source "$HOME/.config/bash/.aliases"

# System fetch
command -v neofetch &>/dev/null && neofetch
