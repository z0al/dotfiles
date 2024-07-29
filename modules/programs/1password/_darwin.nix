{ config, lib, ... }:

let
  cfg = config.d.programs._1password;
in

{
  config = lib.mkIf cfg.enable {
    d.programs.homebrew.casks = [
      # https://github.com/NixOS/nixpkgs/issues/254944
      "1password"
      "1password-cli"
    ];
  };
}
