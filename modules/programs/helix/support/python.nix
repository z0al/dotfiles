{ config, pkgs, lib, ... }:

let
  cfg = config.my.presets.python;
in

{
  config.my.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      python311Packages.python-lsp-server
    ];
  };
}
