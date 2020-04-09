# Dotfiles

My personal dotfiles for both `zsh` and `bash`.

## Features

- 🚀 Super fast shell startup.
- 💅 Minimal and beautiful prompt.
- 🔥 Fuzzy completion + key bindings.
- 💤 Lazy load shell modules when possible.

## Dependencies

- [**antibody**](https://getantibody.github.io): a shell plugin manager made from the ground up thinking about performance.
- [**starship**](https://starship.rs/): The minimal, blazing-fast, and infinitely customizable prompt for any shell.
- [**fzf**](https://github.com/junegunn/fzf): a command-line fuzzy finder to filter files, command history, processes, hostnames, bookmarks, git commits, etc.
- [**fd**](https://github.com/sharkdp/fd): a simple, fast and user-friendly alternative to `find` that automatically respects `.gitignore` files.

#### On Ubuntu/Debian linux

Run the following commands to install all necessary dependencies.

```sh
# System packages
sudo apt install dconf-cli uuid-runtime git curl

# fzf & fd (Ubuntu 19.04 or later)
sudo apt install fzf fd-find

# antibody
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

# starship
curl -fsSL https://starship.rs/install.sh | bash
```

## Installation

**1. Clone this repository:**

```sh
$ git clone https://github.com/z0al/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
```

**2. Run the installation script:**

```sh
$ ./bootstrap.sh
```

**3. (Optional) install color scheme(s)**

You can use [Gogh](https://mayccoll.github.io/Gogh/) to install awesome color scheme(s) for Gnome Terminal, iTerm and others. I prefer `snazzy`.

## Credits

Inspired by [caarlos0's dotfiles](https://github.com/caarlos0/dotfiles) . Most of the shell scripts are copied from there.

## License

MIT © Ahmed T. Ali
