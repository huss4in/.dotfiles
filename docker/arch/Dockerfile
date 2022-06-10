FROM archlinux

ENV TERM xterm-256color

# Dependencies
RUN pacman --noconfirm -Syu && \
    pacman --noconfirm -S \
    sudo which \
    curl wget \
    openssl openssh \
    git zsh stow \
    make gcc \
    neofetch \
    neovim \
    ;

RUN echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
RUN useradd \
    "docker" \
    --create-home \
    --group "wheel" \
    --shell "/bin/zsh" \
    --password "$(openssl passwd -crypt 'docker')"

# Switch to user
USER docker
WORKDIR /home/docker

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile minimal --default-toolchain nightly && \
    source $HOME/.cargo/env && \
    cargo install exa ripgrep bat fd-find stylua

# Python
RUN curl https://pyenv.run | bash && \
    export PYENV_ROOT="$HOME/.pyenv" && \
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH" && \
    eval "$(pyenv init -)" && \
    pyenv update && \
    pyenv install 3.10.5 && \
    pyenv global 3.10.5 && \
    pip install -U pip && \
    pip install -U neovim

# Node
RUN export NVM_DIR="$HOME/.nvm" && \
    curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install --lts && \
    npm install -g npm && \
    npm install -g neovim yarn

# .dotfiles
RUN git clone --recurse-submodules https://github.com/huss4in7/.dotfiles.git ~/.dotfiles
RUN rm ~/.zshenv; cd ~/.dotfiles/stow && stow --stow --verbose --target ~ */

# Start command
CMD [ "/bin/zsh" ]
