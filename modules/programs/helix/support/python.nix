{ config, pkgs, lib, ... }:

let
  cfg = config.d.profiles.dev.python;
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      python311Packages.python-lsp-server
    ];
  };
}
