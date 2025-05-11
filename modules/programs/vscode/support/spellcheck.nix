{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.vscode;
in

{
  my.programs.vscode = lib.mkIf cfg.enable {
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
