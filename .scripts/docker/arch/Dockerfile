FROM archlinux

ENV TERM xterm-256color

# Dependencies
RUN pacman --noconfirm -Syu \
    sudo which curl wget \
    tmux zsh git stow \
    openssl openssh \
    make gcc \
    neofetch \
    unzip;

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
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    source $HOME/.cargo/env && \
    cargo install exa bat ripgrep fd-find rtx-cli bottom hwatch git-delta du-dust tealdeer stylua cargo-update

# Clone .dotfiles
RUN git clone --recurse-submodules https://github.com/huss4in7/.dotfiles.git ~/.dotfiles

# Clone AstroNvim
RUN git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# Configure .dotfiles
RUN rm -rd ~/.zshenv; cd ~/.dotfiles && stow -Svt ~ */

# Start command
CMD [ "/bin/zsh" ]
