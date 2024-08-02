{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.vscode;
in

{
  d.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      streetsidesoftware.code-spell-checker
    ];

    settings = {
      "cSpell.showStatus" = false;
      "cSpell.words" = [
        "Catppuccin"
        "Neovim"
        "NixOS"
      ];
    };
  };
}
