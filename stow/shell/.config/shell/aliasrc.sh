#! /bin/bash

# Realod shell
function src() {
    exec "$SHELL"
}

# function

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
    if ! [[ "$1" =~ ^[0-9]+$ ]]; then echo 3 "$@"; else echo "$1" "${@:2}"; fi
}
function lxt() { lx --tree --level $(_lxt_args "$@"); }
function lxlt() { lxl --tree --level $(_lxt_args "$@"); }
function lxat() { lxa --tree --level $(_lxt_args "$@"); }
function lxdt() { lxld --tree --level $(_lxt_args "$@"); }
function lxldt() { lxld --tree --level $(_lxt_args "$@"); }
function lxadt() { lxad --tree --level $(_lxt_args "$@"); }

# editor
if command -v nvim &>/dev/null; then
    alias v=nvim
fi

# lazygit
alias lg="lazygit"

# explorer.exe
if grep -qi microsoft /proc/version; then
    alias exp="explorer.exe"
fi
