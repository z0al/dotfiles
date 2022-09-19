# https://github.com/catppuccin/gnome-terminal
{ ... }:
{
  # A fallback to avoid breaking the import statement in ../default.nix
  # The repo at https://github.com/catppuccin/gnome-terminal provides a
  # single variant of the theme: mocha
  imports = [
    ./catppuccin-mocha.nix
  ];
}
