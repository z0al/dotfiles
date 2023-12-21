{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.dev.node;
in

{
  options.d.dev.node = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fnm
      nodejs
      nodePackages.prettier
    ];

    d.shell.aliases = {
      nvm = "fnm";
    };

    programs.fish.interactiveShellInit = ''
      fnm env --use-on-cd --version-file-strategy recursive | source
    '';

    d.fs.persisted = {
      directories = [
        ".npm"
        ".cache/yarn"
        ".cache/Cypress"
        ".local/share/fnm"
      ];
      files = [ ".npmrc" ".yarnrc" ];
    };
  };
}
