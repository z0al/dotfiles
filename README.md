# Dotfiles

My [NixOS][nixos] ❄ / macOS 🍏 configuration as a [flake][flakes]. It supports multiple hosts:

- Desktop: Home desktop (NixOS)
- MacBook: My personal MacBook Pro (M2)
- Thinkpad: A ThinkPad X1 Carbon 7th edition for work
- Sandbox: VirtualBox NixOS VM for testing

The repository features a shared [home-manager][hm] configuration between NixOS and macOS (aka. [nix-darwin][darwin]) hosts.

## Highlights

**Shared 🔥:**

- Editors: [LazyVim][lazy] 💤 and [VS Code][vscode].
- Terminal: [Wezterm][wezterm]. The best terminal ever.
- Shell: [Fish][fish] 🐟️ (inc. [starship][starship], [zoxide][z], [fzf][fzf] and [more](./home/cli/))
- Apps: 1Password (with git and ssh integration), Brave, Obsidian ..etc
- Other goodies: [catppuccin][cat]-themed editors/terminal, custom `nix*` CLI [wrapper](./bin/up)

**NixOS ❄:**

- Desktop: Gnome (Wayland) + Pop Shell extension (+ more)
- Root (`/`) is mounted as a temporarily file system (`tmpfs`). Why? [Ok, hear me out](https://grahamc.com/blog/erase-your-darlings/)

**macOS 🍏:**

- [Yabai][yabai]: A tiling window manager.
- Linux-like Keyboard shortcuts ⌨️ (via [Karabiner-elements][karabiner] and more)

## Credits

- [Matthias Benaets's nixos-config](https://github.com/MatthiasBenaets/nixos-config). I highly recommend watching their mini-course on [YouTube](https://youtu.be/AGVXJ-TIv3Y).
- [Digga](https://github.com/divnix/digga/): This repo was initially built with Digga.

## License

MIT © Ahmed T. Ali

[nixos]: https://nixos.org
[flakes]: https://nixos.wiki/wiki/Flakes
[hm]: https://github.com/nix-community/home-manager
[darwin]: https://github.com/LnL7/nix-darwin
[fish]: https://fishshell.com
[z]: https://github.com/ajeetdsouza/zoxide
[fzf]: https://github.com/junegunn/fzf
[starship]: https://starship.rs
[wezterm]: https://wezfurlong.org/wezterm
[lazy]: https://www.lazyvim.org
[vscode]: https://code.visualstudio.com
[cat]: https://github.com/catppuccin/catppuccin
[yabai]: https://github.com/koekeishiya/yabai
[karabiner]: https://karabiner-elements.pqrs.org
