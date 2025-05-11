{ config, pkgs, lib, ... }:

let
  cfg = config.my.presets.rust;
in

{
  my.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      rust-lang.rust-analyzer
    ];

    settings = {
      "rust-analyzer.inlayHints.chainingHints.enable" = false;
    };
  };
}
