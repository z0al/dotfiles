{ config, pkgs, lib, ... }:

let
  cfg = config.d.presets.rust;
in

{
  d.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      rust-lang.rust-analyzer
    ];

    settings = {
      "rust-analyzer.inlayHints.chainingHints.enable" = false;
    };
  };
}
