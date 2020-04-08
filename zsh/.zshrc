#!/bin/zsh

# Enable dir colors
eval "$(dircolors -b)"

# Ignore deplicates in history
setopt histignorealldups sharehistory

# Activate bash-style comments
setopt interactivecomments

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' menu select=2

# Starship prompt
eval "$(starship init zsh)"

# Load plugins
source $HOME/.zsh_plugins.sh

# Load aliases, functions ..etc
source $HOME/.aliases
source $HOME/.exports
source $HOME/.functions
