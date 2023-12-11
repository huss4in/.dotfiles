# Load aliases
[[ -f "$HOME/.config/bash/.aliases" ]] && source "$HOME/.config/bash/.aliases"

# System fetch
command -v neofetch &>/dev/null && neofetch

# -- Instant Prompt -- #
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# -- Instant Prompt -- #

# -- Oh-my-zsh -- #

export ZDOTDIR="${ZDOTDIR:-$HOME}"

# Path to .oh-my-zsh installation.
export ZSH="$ZDOTDIR/.oh-my-zsh"
ZSH_CUSTOM="$ZDOTDIR/custom"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Update reminder
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 2

# zsh options
HYPHEN_INSENSITIV="true"

# vim-mode
MODE_CURSOR_VIINS="#00ff00 blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS #ff0000"
MODE_CURSOR_VICMD="green block"
MODE_CURSOR_SEARCH="#ff00ff steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL #00ffff"

# z
_Z_DATA="$ZDOTDIR/.z"

# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$ZDOTDIR/.history_zsh"

KEYTIMEOUT=10

plugins=(
    # ZSH Plugins
    z
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-bash-completions-fallback
    zsh-history-substring-search

    # VI Mode
    zsh-vim-mode

    # Tools Integration
    git
    fzf

    rust
    rtx

    python
    pip

    node
    npm

    docker
    docker-compose
)

# Source local config
source "$ZDOTDIR/local.zshrc"

source $ZSH/oh-my-zsh.sh

# -- Oh-my-zsh -- #

# -- Configuration -- #

# Completion.
autoload -Uz compinit; compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

unsetopt autopushd

# -- Configuration -- #

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
