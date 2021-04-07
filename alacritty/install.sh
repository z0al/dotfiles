#!/bin/sh

# Install Rust to use Cargo
curl https://sh.rustup.rs -sSf | bash -s -- -y  

# https://github.com/alacritty/alacritty/blob/master/INSTALL.md#debianubuntu
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

# Install Alacritty
cargo install alacritty

# Desktop entry
__dirname__="$(dirname $(realpath $0))"
sudo desktop-file-install "$__dirname__/Alacritty.desktop"
sudo cp "$__dirname__/Alacritty.svg" /usr/share/pixmaps/Alacritty.svg