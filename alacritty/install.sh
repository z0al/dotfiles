#!/bin/sh

# Install Rust to use Cargo
curl https://sh.rustup.rs -sSf | bash -s -- -y  

# https://github.com/alacritty/alacritty/blob/master/INSTALL.md#debianubuntu
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

# Install Alacritty
cargo install alacritty