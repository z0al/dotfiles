#!/bin/sh

BASE_DIR=$(cd "$(dirname "$0")" && pwd)

# Add/override a symlink
sym_link() {
  echo "Linking '$1' -> '$2'"
  dirname "$2" | xargs mkdir -p
  ln -snf "$1" "$2"
}

# Remove the target directory then symlink
sym_link_folder(){
  rm -rf "$1"
  sym_link "$1" "$2"
}

# Add aliases for dotfiles
# ========================

find "$BASE_DIR" -maxdepth 1 -type f -name ".*" -not -name ".gitignore" |
while read -r file ;do 
  f=$(basename "$file")
  sym_link "$file" "$HOME/$f"
done

# Add aliases for dotfolders
# ==========================

sym_link "$BASE_DIR/.oh-my-zsh" "$HOME/.oh-my-zsh"

sym_link "$BASE_DIR/.zcustom" "$HOME/.zcustom"

echo "Done, enjoy!"