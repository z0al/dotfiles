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

      extensions = with pkgs.vscode-extensions; ([
        # Git
        eamodio.gitlens

        # Languages
        bradlc.vscode-tailwindcss
        bungcip.better-toml
        dotjoshjohnson.xml
        jnoortheen.nix-ide
        # ms-python.python not supported in Darwin (because of gdb)

        # Themes
        dracula-theme.theme-dracula
        catppuccin.catppuccin-vsc

        # Formatting and linting
        dbaeumer.vscode-eslint
        editorconfig.editorconfig
        esbenp.prettier-vscode
        streetsidesoftware.code-spell-checker
        # JohnnyMorganz.stylua
      ] ++
      optionals (cfg.withCopilot) [ github.copilot ]);
    };

    d.fs.persisted = mkIf cfg.enable {
      directories = [ ".config/Code/User/globalStorage" ];
    };
  };
}
