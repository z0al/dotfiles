{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.vscode;
in

{
  d.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      bradlc.vscode-tailwindcss
      dotjoshjohnson.xml
      editorconfig.editorconfig
      foxundermoon.shell-format
      hashicorp.terraform
      jnoortheen.nix-ide
      johnnymorganz.stylua
      ms-azuretools.vscode-docker
      okitavera.vscode-nunjucks-formatter
      ronnidc.nunjucks
      tamasfe.even-better-toml
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

      # Nix
      "nix.formatterPath" = lib.getExe pkgs.nixpkgs-fmt;
    };
  };
}
