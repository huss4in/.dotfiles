export EDITOR="nvim"
export VISUAL="$EDITOR"
export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_ALL="$LANG"

# PATH
export PATH="$HOME/.local/bin:$PATH"

# cargo
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# brew
[ -s "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
