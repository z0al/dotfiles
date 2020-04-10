# Dotfiles

My personal configurations for zsh, nvm, terminals and more.

## Philosophy

- 🚀 Super fast shell startup.
- 💅 Minimal and beautiful prompt.
- 🔥 Fuzzy completion + key bindings.
- 💤 Lazy load shell modules when possible.

## Dependencies

- [**antibody**][antibody]: a shell plugin manager made from the ground up thinking about performance.
- [**starship**][starship]: The minimal, blazing-fast, and infinitely customizable prompt for any shell.
- [**fzf**][fzf]: a command-line fuzzy finder to filter files, command history, processes, hostnames, bookmarks, git commits, etc.
- [**fd**][fd]: a simple, fast and user-friendly alternative to `find` that automatically respects `.gitignore` files.

#### On Ubuntu/Debian linux

Run the following commands to install all necessary dependencies.

```sh
# System packages
sudo apt install git curl zsh dconf-cli uuid-runtime

# fzf & fd (Ubuntu 19.04 or later)
sudo apt install fzf fd-find

# antibody
curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin

# starship
curl -fsSL https://starship.rs/install.sh | bash
```

#### On other OSs

Please check the website for each dependency and follow the intructions for your system (if supported).

## Installation

```sh
$ git clone https://github.com/z0al/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ./bootstrap.py # or python3 bootstrap.py
```

Restart your zsh shell to see the changes.

## Color schemes

Optionally, you can use [Gogh][gogh] to install awesome color scheme(s) for Gnome Terminal, iTerm and others. I prefer `snazzy`.

## Credits

Inspired by [caarlos0's dotfiles](https://github.com/caarlos0/dotfiles).

## License

MIT © Ahmed T. Ali

[antibody]: https://getantibody.github.io
[starship]: https://starship.rs/
[fzf]: https://github.com/junegunn/fzf
[fd]: https://github.com/sharkdp/fd
[gogh]: https://mayccoll.github.io/Gogh/
