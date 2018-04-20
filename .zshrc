#!/bin/zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# We don't want/can't to use the built-in custom directory itself (due
# to git submodules), just change the path of $ZSH_CUSTOM inside your 
# `.zshrc` to a directory of your own liking. Everything will be fine 
# as long as you adhere to the conventional file hierarchy.
ZSH_CUSTOM="$HOME/.zcustom"

# Append ZSH_CUSTOM to fpath (for pure prompt to be discovered)
fpath=( "$ZSH_CUSTOM" $fpath )

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

# Set prompt to pure if available
# More: https://github.com/sindresorhus/pure
if [[ -a "$HOME/.zcustom/async" && -a "$HOME/.zcustom/prompt_pure_setup" ]]; then
  autoload -U promptinit; promptinit
  prompt pure
else 
  # Fallback to the default theme
  ZSH_THEME="robbyrussell"
  source "$ZSH/themes/robbyrussell.zsh-theme"
fi