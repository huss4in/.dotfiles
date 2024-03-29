FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive 

# Dependencies
RUN apt update -y && \
    apt upgrade -y && \
    apt install -y \
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
    python3 python3-distutils \
    locales \
    # && update-alternatives --install /usr/bin/python python "/usr/bin/python3.10" 0 \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

ENV LANG en_US.utf8

# User
RUN useradd \
    "husslin" \
    --group "sudo" \
    --shell "/bin/zsh" \
    --home "/home/husslin" \
    --password "$(openssl passwd -5 'docker')"

RUN echo "husslin ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers


# Switch to user
USER husslin
WORKDIR /home/husslin

ENV TERM xterm-256color

# .dotfiles
RUN git clone --recurse-submodules https://github.com/huss4in7/.dotfiles.git ~/.dotfiles
RUN rm ~/.zshenv; cd ~/.dotfiles/stow && stow --stow --verbose --target ~ */

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN ~/.cargo/bin/cargo install exa ripgrep stylua

# Python
RUN curl https://bootstrap.pypa.io/get-pip.py | python3 && \
    python3 -m pip install -U pip && \
    python3 -m pip install -U neovim

# Node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
    export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    nvm install v14 && \
    npm install -g npm && \
    npm install -g neovim yarn

# Start command
CMD [ "/bin/zsh" ]
