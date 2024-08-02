{ config, pkgs, lib, ... }:

let
  cfg = config.d.profiles.dev.copilot;
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
