#
# ~/.bashrc
#

BASHDOTDIR="$HOME/.config/bash"

# Load ~/.profile
[[ -f "$HOME/.profile" ]] && . "$HOME/.profile"

# Load aliases
[ -f "$HOME/.config/shell/aliasrc" ] && source "$HOME/.config/shell/aliasrc"
