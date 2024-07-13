{ config, pkgs, lib, ... }:

with lib;
with pkgs.stdenv;

let
  cfg = config.d.shell;

  module = {
    aliases = mkOption {
      type = types.attrs;
      default = { };
    };

    variables = mkOption {
      type = types.attrs;
      default = { };
    };
  };
in

{
  imports = [
    ./aliases.nix
    ./fish.nix
  ];

  options.d.shell = module // {
    linux = module;
    darwin = module;

    sources = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };
  };

  config = {
    home.sessionVariables = mkMerge [
      cfg.variables
      (mkIf isLinux cfg.linux.variables)
      (mkIf isDarwin cfg.darwin.variables)
    ];

    home.shellAliases = mkMerge [
      cfg.aliases
      (mkIf isLinux cfg.linux.aliases)
      (mkIf isLinux cfg.darwin.aliases)
    ];
  };
}
