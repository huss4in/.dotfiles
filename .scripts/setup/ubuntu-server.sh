curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal --default-toolchain stable &&
	source $HOME/.cargo/env &&
	cargo install exa ripgrep bat fd-find stylua
export PYENV_ROOT="$HOME/.pyenv" && curl https://pyenv.run | bash &&
	command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH" && eval "$(pyenv init -)" &&
	pyenv update &&
	pyenv install 3.10.6 &&
	pyenv global 3.10.6 &&
	pip install -U pip &&
	pip install -U neovim
export NVM_DIR="$HOME/.nvm" && curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash &&
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" &&
	nvm install --lts &&
	npm install -g npm yarn &&
	npm install -g neovim
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone --recurse-submodules https://github.com/huss4in7/.dotfiles.git ~/.dotfiles &&
	rm ~/.zshenv
cd ~/.dotfiles/stow && stow -Svt ~ bash/ neofetch/ rust/ shell/ tmux/ zsh/ AstroNvim/
