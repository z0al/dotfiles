# Dotfiles

My personal dotfiles for both `zsh` and `bash`.

## Features

- 🚀 Super fast shell startup.
- 💅 Minimal and beautiful prompt.
- 🔥 Fuzzy completion + key bindings.

## Dependencies

Run the following commands to install necessary dependencies. **Assumes Ubuntu/Debian** environment.

```sh
# System packages
sudo apt install dconf-cli uuid-runtime git curl

# Antibody: a fast shell plugin manager
# https://getantibody.github.io
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

# Starship: a minimal and fast cross-shell prompt
# https://starship.rs/
curl -fsSL https://starship.rs/install.sh | bash

# fzf: a command-line fuzzy finder
# https://github.com/junegunn/fzf
sudo apt install fzf

# fd: an alternative to 'find' that respects .gitignore
# https://github.com/sharkdp/fd
sudo apt install fd-find

# nvm: a version manager for Node.js. Lazy loaded for a faster shell startup.
# https://github.com/nvm-sh/nvm
git clone https://github.com/nvm-sh/nvm.git .nvm

# Gogh (optional): provides color schemes for Gnome Terminal, iTerm and others.
# https://github.com/Mayccoll/Gogh
bash -c  "$(curl -sLo- https://git.io/vQgMr)"
```

## Installation

**1. Clone this repository:**

```sh
$ git clone https://github.com/z0al/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

**2. Run the installation script:**

```sh
$ ./install.sh
```

**4. Restart your shell to see the changes. Enjoy!**

## License

MIT © Ahmed T. Ali
