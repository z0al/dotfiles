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
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Starship prompt
eval "$(starship init zsh)"

# Load plugins
source $HOME/.zsh_plugins.sh

# Load aliases, functions ..etc
source $HOME/.aliases
source $HOME/.exports
source $HOME/.functions
