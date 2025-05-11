{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.vscode;
in

{
  my.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      bierner.markdown-footnotes
      bmalehorn.vscode-fish
      bradlc.vscode-tailwindcss
      dotjoshjohnson.xml
      editorconfig.editorconfig
      foxundermoon.shell-format
      hashicorp.terraform
      johnnymorganz.stylua
      ms-azuretools.vscode-docker
      okitavera.vscode-nunjucks-formatter
      qezhu.gitlink
      ronnidc.nunjucks
      sndst00m.vscode-native-svg-preview
      tamasfe.even-better-toml
      xaver.clang-format
      yzhang.markdown-all-in-one
    ];

    settings = {
      # Lua
      "[lua]" = {
        "editor.defaultFormatter" = "JohnnyMorganz.stylua";
      };

      # Shell Format
      "shellformat.useEditorConfig" = true;
      "shellformat.path" = lib.getExe pkgs.shfmt;

      # Docker
      "[dockerfile]" = {
        "editor.defaultFormatter" = "ms-azuretools.vscode-docker";
      };

      # C/C++
      "[c]" = {
        "editor.defaultFormatter" = "xaver.clang-format";
      };

      # SVG fix
      # https://github.com/microsoft/vscode/issues/239834
      "workbench.editorAssociations" = {
        "*.svg" = "default";
      };
    };
  };
}
