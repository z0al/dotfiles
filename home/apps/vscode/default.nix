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
        ronnidc.nunjucks
        rust-lang.rust-analyzer
        tamasfe.even-better-toml
        prisma.prisma
        ms-azuretools.vscode-docker

        # Themes
        dracula-theme.theme-dracula
        catppuccin.catppuccin-vsc

        # Formatting and linting
        dbaeumer.vscode-eslint
        editorconfig.editorconfig
        esbenp.prettier-vscode
        foxundermoon.shell-format
        johnnymorganz.stylua
        okitavera.vscode-nunjucks-formatter
        streetsidesoftware.code-spell-checker
      ]
      ++ (optionals (pkgs.stdenv.isLinux) [ ms-python.python ])
      ++ (optionals (cfg.withCopilot) [ github.copilot ]));
    };

    d.fs.persisted = mkIf cfg.enable {
      directories = [ ".config/Code/User" ];
    };
  };
}
