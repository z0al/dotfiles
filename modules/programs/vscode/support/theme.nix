{ config, pkgs, ... }:

let
  cfg = config.my.programs.vscode;
in

{
  my.programs.vscode = {
    extensions = with pkgs.vscode-marketplace; [
      catppuccin.catppuccin-vsc
      pmndrs.pmndrs
    ];

    settings = {
      "workbench.colorTheme" = cfg.theme;
    };
  };
}
