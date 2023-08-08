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

  config = {
    programs.vscode = {
      enable = cfg.enable;

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
        # ms-python.python not supported on Darwin (because of gdb)

        # Themes
        dracula-theme.theme-dracula
        catppuccin.catppuccin-vsc

        # Formatting and linting
        dbaeumer.vscode-eslint
        editorconfig.editorconfig
        esbenp.prettier-vscode
        johnnymorganz.stylua
        okitavera.vscode-nunjucks-formatter
        streetsidesoftware.code-spell-checker
      ] ++
      optionals (cfg.withCopilot) [ github.copilot ]);
    };

    d.fs.persisted = mkIf cfg.enable {
      directories = [ ".config/Code/User" ];
    };
  };
}
