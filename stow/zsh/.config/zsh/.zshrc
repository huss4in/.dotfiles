# System fetch
neofetch

# -- Instant Prompt -- #
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# -- Instant Prompt -- #

# Load aliases
[[ -f "$HOME/.config/shell/.aliasrc" ]] && source "$HOME/.config/shell/.aliasrc"

# -- Oh-my-zsh -- #

export ZDOTDIR="${ZDOTDIR:-$HOME}"

# Path to .oh-my-zsh installation.
export ZSH="$ZDOTDIR/.oh-my-zsh"
ZSH_CUSTOM="$ZDOTDIR/custom"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Update reminder
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 7

# zsh options
HYPHEN_INSENSITIVE="true"

export NVM_DIR="$HOME/.config/.nvm"
# export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

plugins=(
  # zsh plugins
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-bash-completions-fallback

  # vi mode
  vi-mode
  zsh-vimode-visual

  # directory jumping
  z
  zsh-interactive-cd

  # tools integration
  git
  docker

  rust

  python
  pyenv
  pip

  zsh-nvm
  npm
  node
  yarn

  aws
)

# - Plugins options - #

# z
_Z_DATA="$ZDOTDIR/.z"

# - Plugins options - #

source $ZSH/oh-my-zsh.sh

# -- Oh-my-zsh -- #

function reload() {
    source ~/.zshenv
    source ~/.config/zsh/.zlogin
    source ~/.config/zsh/.zprofile
}

# -- Configuration -- #

# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$ZDOTDIR/.history_zsh"

# Completion
autoload -U compinit && compinit
autoload -U +X bashcompinit && bashcompinit
zstyle ':completion:*' menu select

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# -- Configuration -- #

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

