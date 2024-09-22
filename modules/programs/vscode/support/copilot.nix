{ config, pkgs, lib, ... }:

let
  cfg = config.d.presets.copilot;
in

{
  d.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      github.copilot
    ];

    settings = {
      "github.copilot.editor.enableCodeActions" = false;
    };
  };
}
