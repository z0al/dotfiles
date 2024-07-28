{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.dev.node;

  lts-major = builtins.substring 0 2 pkgs.nodePackages.nodejs.version;
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
      bun
      fnm
      nodePackages.prettier
    ];

    home.shellAliases = {
      nvm = "fnm";
    };

    home.file.".node-version".text = lts-major;

    programs.fish.interactiveShellInit = ''
      # Node.js
      fnm env --use-on-cd --corepack-enabled --version-file-strategy recursive --log-level quiet | source
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
