#!/bin/zsh

# enable dir colors
eval "$(dircolors -b)"

# ignore deplicates in history
setopt histignorealldups

# share history between sessions
setopt sharehistory

# activate bash-style comments
setopt interactivecomments

# keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Key bindings

# delete word with CTRL+BACKSPACE
bindkey '^H' backward-delete-word
