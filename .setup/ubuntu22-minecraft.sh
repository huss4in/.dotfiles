#!/bin/bash

set -x

sudo apt update -y && sudo apt full-upgrade -y
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
  cargo install exa ripgrep bat tealdeer fd-find stylua

# Install Python
export PYENV_ROOT="$HOME/.pyenv" && curl https://pyenv.run | bash && \
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH" && eval "$(pyenv init -)" && \
  pyenv update && \
  pyenv install 3.10 && \
  pyenv global 3.10 && \
  pip install -U pip && \
  pip install -U neovim

# Install Node
export NVM_DIR="$HOME/.nvm" && mkdir $NVM_DIR && curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
  nvm install --lts && \
  npm install -g npm yarn && \
  npm install -g neovim

# Install Docker
sh <(curl -fsSL https://get.docker.com)
sudo usermod -aG docker $USER

# .dotfiles
git clone --recurse-submodules https://github.com/huss4in7/.dotfiles.git ~/.dotfiles
rm -f ~/.zshenv; cd ~/.dotfiles/stow && stow -Svt ~ */

sudo chsh -s /bin/zsh "$USER"
