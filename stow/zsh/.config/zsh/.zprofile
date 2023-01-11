export EDITOR="nvim"
export VISUAL="$EDITOR"
export LANG="en_US.UTF-8"
export LANGUAGE="en"
export LC_ALL="$LANG"

# path
export PATH="$HOME/.local/bin:$PATH"

# cargo
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv &> /dev/null && eval "$(pyenv init --path)"

# nvm
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
