#!/bin/bash

set -eux

sudo apt update -y && sudo apt full-upgrade -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt install -y \
  sudo \
  zsh \
  openssl \
  git \
  stow \
  wget curl \
  vim neovim \
  neofetch \
  fzf \
  gcc \
  ;

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal --default-toolchain stable && \
  source $HOME/.cargo/env && \
  cargo install exa ripgrep bat fd-find stylua

# Install Python
export PYENV_ROOT="$HOME/.pyenv" && curl https://pyenv.run | bash && \
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH" && eval "$(pyenv init -)" && \
  pyenv update && \
  pyenv install 3.10.6 && \
  pyenv global 3.10.6 && \
  pip install -U pip && \
  pip install -U neovim

# Install Node
export NVM_DIR="$HOME/.nvm" && curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
  nvm install --lts && \
  npm install -g npm yarn && \
  npm install -g neovim

# Install AstroNvim
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# .dotfiles
rm ~/.zshenv; cd ~/.dotfiles/stow && stow -Svt ~ bash/ neofetch/ rust/ shell/ tmux/ zsh/ AstroNvim/
