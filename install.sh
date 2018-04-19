#!/bin/sh

BASE_DIR=$(cd "$(dirname "$0")" && pwd)

sym_link() {
  echo "Linking '$1' -> '$2'"
  dirname "$2" | xargs mkdir -p
  ln -sf "$1" "$2"
}

# Add aliases for dotfiles
find "$BASE_DIR" -maxdepth 1 -type f -name ".*" -not -name ".gitignore" |
while read -r file ;do 
  f=$(basename "$file")
  sym_link "$file" "$HOME/$f"
done
