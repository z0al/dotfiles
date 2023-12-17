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

    sources = mkOption {
      type = types.listOf types.str;
      default = [ ];
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
  };

  config = {
    home.sessionVariables = cfg.variables //
      (mkIf isLinux cfg.linux.variables) //
      (mkIf isDarwin cfg.darwin.variables);

    home.shellAliases = cfg.aliases //
      (mkIf isLinux cfg.linux.aliases) //
      (mkIf isDarwin cfg.darwin.aliases);
  };
}
