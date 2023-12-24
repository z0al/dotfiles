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

    # Should ideally use --version-file-strategy recursive
    # https://github.com/Schniz/fnm/issues/681
    programs.fish.interactiveShellInit = ''
      fnm env --use-on-cd | source
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
