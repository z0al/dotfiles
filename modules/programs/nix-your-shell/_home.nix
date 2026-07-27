{ lib, ... }:

{
  config = {
    programs.nix-your-shell.enable = lib.mkDefault true;
  };
}
