#!/usr/bin/env bash

sudo apt update

sudo apt install -y git automake bison build-essential pkg-config libevent-dev libncurses5-dev

rm -fr /tmp/tmux

git clone https://github.com/tmux/tmux.git /tmp/tmux && pushd /tmp/tmux && git checkout master

sh autogen.sh && ./configure && make && sudo make install && popd

rm -fr /tmp/tmux
