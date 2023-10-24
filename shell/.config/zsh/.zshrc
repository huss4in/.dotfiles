# System fetch
command -v neofetch &>/dev/null && neofetch

# -- Instant Prompt -- #
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
# -- Instant Prompt -- #

# Load aliases
[[ -f "$HOME/.config/bash/.aliases" ]] && source "$HOME/.config/bash/.aliases"

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
    # zsh plugins
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-bash-completions-fallback
    zsh-history-substring-search

    # vi mode
    zsh-vim-mode

    # directory jumping
    z
    # zsh-interactive-cd

    # tools integration
    git
    docker

    rust

    python
    pip

    # aws
)

source $ZSH/oh-my-zsh.sh
[[ -f "/usr/share/fzf/completion.zsh" ]] && source /usr/share/fzf/completion.zsh
[[ -f "/usr/share/fzf/key-bindings.zsh" ]] && source /usr/share/fzf/key-bindings.zsh

# -- Oh-my-zsh -- #

# -- Configuration -- #

# Completion
autoload -U compinit; compinit
autoload -U +X bashcompinit && bashcompinit
zstyle ':completion:*' menu select

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

