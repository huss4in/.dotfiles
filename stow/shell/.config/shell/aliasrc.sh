#! /bin/bash


# Realod shell
function src() {
    exec "$SHELL"
}

# aliases
alias v="nvim"
alias hx="helix"
alias lg="lazygit"

# tmux
function tx() {
    [[ -n "$2" ]] && ( tmux attach -t "$1" -c "$2" 2>/dev/null && return || cd "$2" )

    tmux new -As "$1"
}

# exa
alias \
    exa="exa --icons" \
    \
    lx="exa" \
    lxl="lx --long" \
    lxa="lxl --all --group --header" \
    \
    lxd="lx --only-dirs" \
    lxld="lxl --only-dirs" \
    lxad="lxa --only-dirs" \
    \
    lxg="lxlg" \
    lxlg="lxl --git" \
    lxag="lxa --git" \
    \
    lxdg="lxldg" \
    lxldg="lxl --only-dirs --git" \
    lxadg="lxa --only-dirs --git"

function _lxt_args() {
    if  [[ "$1" =~ ^[0-9]+$ ]]; then echo "$1" "${@:2}"; else echo 2 "$@"; fi
}
function lxt() { lx --tree --level $(_lxt_args "$@"); }
function lxlt() { lxl --tree --level $(_lxt_args "$@"); }
function lxat() { lxa --tree --level $(_lxt_args "$@"); }
function lxdt() { lxld --tree --level $(_lxt_args "$@"); }
function lxldt() { lxld --tree --level $(_lxt_args "$@"); }
function lxadt() { lxad --tree --level $(_lxt_args "$@"); }

# explorer.exe
if grep -qi microsoft /proc/version; then
    alias exp="explorer.exe"
fi
