{ config, pkgs, lib, ... }:

let
  cfg = config.my.presets.copilot;
in

{
  my.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      github.copilot
    ];

    settings = {
      "github.copilot.editor.enableCodeActions" = false;
    };
  };
}
