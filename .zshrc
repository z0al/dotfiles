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

# Pure prompt (https://github.com/sindresorhus/pure)
# 
# Inspired by sindresorhus/pure#384
PURE_PROMPT_DIR="$ZSH_CUSTOM/pure"

if [[ -d "$PURE_PROMPT_DIR" ]] ; then
  # If the pure submodule has been fetched
  # align the setup files with pure's expectations
  if [[ ! -f "$PURE_PROMPT_DIR/prompt_pure_setup" ]] ; then
      ln -sf "$PURE_PROMPT_DIR/pure.zsh" "$PURE_PROMPT_DIR/prompt_pure_setup"
  fi
  if [[ ! -f "$PURE_PROMPT_DIR/async" ]] ; then
      ln -sf "$PURE_PROMPT_DIR/async.zsh" "$PURE_PROMPT_DIR/async"
  fi

  # the set the path to pure
  fpath+=("$PURE_PROMPT_DIR")
  autoload -U promptinit; promptinit
  prompt pure
else
  # Fallback to the default theme
  ZSH_THEME="robbyrussell"
  source "$ZSH/themes/robbyrussell.zsh-theme"
fi