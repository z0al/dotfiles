{ config, pkgs, lib, user, ... }:

with lib;
with pkgs.stdenv;

let
  module = {
    enable = mkOption {
      type = types.bool;
      default = profiles.base.enable;
    };

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

  cfg = config.d.shell;
  profiles = config.d.profiles;

  # FIXME: remove later
  cfgHome = config.home-manager.users.${user}.d.shell;

  aliases = cfg.aliases //
    # FIXME: remove later
    cfgHome.aliases // {
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";

    clear = "tput reset";
    grep = "rg";
    mkdir = "mkdir -p";
  };

  variables = cfg.variables // cfgHome.variables;
in

{
  options.d.shell = module;

  config = {
    # FIXME: remove later
    d.shell.sources = cfgHome.sources;

    d.hm = [{
      # FIXME: remove later
      options.d.shell = module;

      config = {
        home.sessionVariables = variables;
        home.shellAliases = aliases;
      };
    }];
  };
}
