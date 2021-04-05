#!/bin/sh

sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which alacritty) 50
sudo update-alternatives --config x-terminal-emulator

# To remove use:
# sudo update-alternatives --remove "x-terminal-emulator" "$(which alacritty)"