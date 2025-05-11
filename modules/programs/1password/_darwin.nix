{ config, lib, ... }:

let
  cfg = config.my.programs._1password;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      # https://github.com/NixOS/nixpkgs/issues/254944
      "1password"
      "1password-cli"
    ];
  };
}
