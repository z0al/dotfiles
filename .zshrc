#!/bin/zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# We will try to use 'pure' by Sindre Sorhus first
ZSH_THEME=""

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  dotenv
  emoji
  zsh-syntax-highlighting
)

# Setup oh-my-zsh if exists
if [[ -a "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

# Append .zfunctions to fpath if exists
if [[ -a "$HOME/.zfunctions" ]]; then
  fpath=( "$HOME/.zfunctions" $fpath )
fi


# Set prompt to pure (by Sindre Sorhus) if available
if [[ -a "$HOME/.zfunctions/async" && -a "$HOME/.zfunctions/prompt_pure_setup" ]]; then
  autoload -U promptinit; promptinit
  prompt pure
else 
  # Fallback to the default theme
  ZSH_THEME="robbyrussell"
  source "$ZSH/themes/robbyrussell.zsh-theme"
fi