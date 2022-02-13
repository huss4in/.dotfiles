# -- Instant Prompt -- #
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# -- Instant Prompt -- #


# -- Oh-my-zsh -- #

export ZDOTDIR="${ZDOTDIR:-$HOME}"

# Path to your oh-my-zsh installation.
export ZSH="$ZDOTDIR/.oh-my-zsh"
ZSH_CUSTOM="$ZDOTDIR/custom"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Update reminder
zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' frequency 1

# zsh options
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

# Plugins options

plugins=(
  # tools
  git
  pip
  docker

  # zsh plugins
  z
  zsh-vi-mode
  zsh-completions
  zsh-interactive-cd
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-history-substring-search

  # others
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# -- Oh-my-zsh -- #


# -- Configuration -- #

# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$ZDOTDIR/.zsh_history"

# # Basic auto/tab complete:
# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
# # _comp_options+=(globdots) # Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Load aliases
[[ -f "$HOME/.config/shell/aliasrc" ]] && source "$HOME/.config/shell/aliasrc"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# -- Configuration -- #


# -- Welcome prompt -- #

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
neofetch --disable packages

# -- Welcome prompt -- #