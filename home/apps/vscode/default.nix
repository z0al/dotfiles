{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.vscode;
in

{
  imports = [
    ./settings
    ./keybindings.nix
  ];

  options.d.apps.vscode = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    withCopilot = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    programs.vscode = {
      enable = true;

      mutableExtensionsDir = true;
      enableUpdateCheck = false;
      enableExtensionUpdateCheck = true;

      extensions = with pkgs.vscode-marketplace; ([
        # Git
        eamodio.gitlens

        # Languages
        bradlc.vscode-tailwindcss
        dotjoshjohnson.xml
        hashicorp.terraform
        jnoortheen.nix-ide
        ms-azuretools.vscode-docker
        ms-python.python
        ms-python.vscode-pylance
        prisma.prisma
        ronnidc.nunjucks
        rust-lang.rust-analyzer
        tamasfe.even-better-toml

        # Themes
        catppuccin.catppuccin-vsc
        dracula-theme.theme-dracula

        # Formatting and linting
        dbaeumer.vscode-eslint
        editorconfig.editorconfig
        esbenp.prettier-vscode
        foxundermoon.shell-format
        johnnymorganz.stylua
        ms-python.black-formatter
        okitavera.vscode-nunjucks-formatter
        streetsidesoftware.code-spell-checker
      ]
      ++ (optionals (cfg.withCopilot) [ github.copilot ]));
    };

    d.fs.persisted = mkIf cfg.enable {
      directories = [ ".config/Code/User" ];
    };
  };
}
