{ config, pkgs, ... }:

let
  cfg = config.d.programs.vscode;
in

{
  d.programs.vscode = {
    extensions = with pkgs.vscode-marketplace; [
      catppuccin.catppuccin-vsc
      pmndrs.pmndrs
    ];

    settings = {
      "workbench.colorTheme" = cfg.theme;
    };
  };
}
