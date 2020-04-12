#!/bin/zsh

export PATH="$HOME/.fnm":$PATH

eval "$(fnm env --multi)"

alias nvm=fnm
