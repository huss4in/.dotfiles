#!/bin/sh

[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

command -v rtx >/dev/null 2>&1 && eval "$(rtx activate bash)"
