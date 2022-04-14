export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER="less"

export TZ="Asia/Bahrain"
export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_ALL="$LANG"

# Load .profile
[[ -f "$HOME/.profile" ]] && source "$HOME/.profile"
[[ -f "$HOME/.zprofile" ]] && source "$HOME/.zprofile"

export SHELL_SESSIONS_DISABLE=1
