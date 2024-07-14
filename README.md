# Dotfiles

> [!IMPORTANT]
> This repository is undergoing a major refactoring and the README is a bit outdated. if you want to go back before the refactoring started click [here](https://github.com/z0al/dotfiles/tree/7587fd6d3ee70338ae5234646d21de36d45cf87f).

My [NixOS][nixos] & macOS configuration as a [flake][flakes]. It features a shared [home-manager][hm] configuration between NixOS and macOS (aka. [nix-darwin][darwin]) hosts as well as host/platform specific configs.

## Highlights

**Shared 🔥:**

- Editors: [Helix][helix] and [VS Code][vscode].
- Terminal: [Wezterm][wezterm]. The best terminal ever.
- Shell: [Fish][fish] 🐟️ (inc. [starship][starship], [zoxide][z], [fzf][fzf] and [more](./home/cli/))
- Apps: 1Password (with git and ssh integration), Obsidian ..etc
- Other goodies: [catppuccin][cat]-themed editors/terminal, custom `nix*` CLI [wrapper](./bin/up)

**NixOS ❄:**

- Desktop: Gnome + Pop Shell extension (+ more)
- Root (`/`) is mounted as a temporarily file system (`tmpfs`). Why? [Ok, hear me out](https://grahamc.com/blog/erase-your-darlings/)

**macOS 🍏:**

- [Yabai][yabai]: A tiling window manager.

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
[helix]: https://helix-editor.com/
[vscode]: https://code.visualstudio.com
[cat]: https://github.com/catppuccin/catppuccin
[yabai]: https://github.com/koekeishiya/yabai
