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
    vim neovim \
    lazygit \
    ;

RUN echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
RUN useradd \
    "docker" \
    --create-home \
    --group "wheel" \
    --shell "/bin/zsh" \
    --password "$(openssl passwd -crypt 'docker')"

RUN echo "LC_ALL=en_US.UTF-8" | tee -a /etc/environment > /dev/null & \
    echo "en_US.UTF-8 UTF-8" | tee -a /etc/locale.gen > /dev/null & \
    echo "LANG=en_US.UTF-8" | tee /etc/locale.conf > /dev/null && \
    locale-gen en_US.UTF-8;

# Switch to user
USER docker
WORKDIR /home/docker

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --profile none --default-toolchain stable && \
    source $HOME/.cargo/env && \
    cargo install exa ripgrep bat tealdeer fd-find stylua

# Python
RUN export PYENV_ROOT="$HOME/.pyenv" && curl https://pyenv.run | bash && \
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH" && eval "$(pyenv init -)" && \
    pyenv update && \
    pyenv install 3.11 && \
    pyenv global 3.11 && \
    pip install -U pip && \
    pip install -U neovim

# Node
RUN export NVM_DIR="$HOME/.nvm" && mkdir $NVM_DIR && curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install --lts && \
    npm install -g npm yarn && \
    npm install -g neovim

# # AstroNvim
# RUN git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# .dotfiles
RUN git clone --recurse-submodules https://github.com/huss4in7/.dotfiles.git ~/.dotfiles
RUN rm ~/.zshenv; cd ~/.dotfiles/stow && stow -Svt ~ */

# Start command
CMD [ "/bin/zsh" ]
