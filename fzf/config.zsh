#!/bin/zsh

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND="fd --type f --max-depth 10"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --height=30%"

# ALT-C - cd into the selected directory.
export FZF_ALT_C_COMMAND="fd --type d ---max-depth 10"

# CTRL-T - Paste the selected files and directories onto the command-line.
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Use fd instead of find for fzf completion
_fzf_compgen_path() {
	eval $FZF_DEFAULT_COMMAND . "$1"
}

_fzf_compgen_dir() {
	eval $FZF_ALT_C_COMMAND . "$1"
}
