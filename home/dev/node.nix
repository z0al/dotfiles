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
      fnm
      nodePackages.prettier
    ];

    d.shell.aliases = {
      nvm = "fnm";
    };

    home.file.".node-version".text = lts-major;

    programs.fish.interactiveShellInit = ''
      # Node.js
      fnm env --use-on-cd --version-file-strategy recursive | source

      alias yarn="corepack yarn"
      alias yarnpkg="corepack yarnpkg"
      alias pnpm="corepack pnpm"
      alias pnpx="corepack pnpx"
      alias npm="corepack npm"
      alias npx="corepack npx"
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
