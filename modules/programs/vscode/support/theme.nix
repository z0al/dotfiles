{ pkgs, theme, ... }:

let
  themeMapping = {
    catppuccin = "Catppuccin Mocha";
  };
in

{
  d.programs.vscode = {
    extensions = with pkgs.vscode-marketplace; [
      catppuccin.catppuccin-vsc
      pmndrs.pmndrs
    ];

    settings = {
      "workbench.colorTheme" = themeMapping.${theme};
    };
  };
}
