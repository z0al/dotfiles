{ config, lib, user, ... }:

{
  imports = [
    ./keymap
    ./karabiner.nix
    ./shells.nix
  ];
}
