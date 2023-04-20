{ config, pkgs, lib, user, ... }:

with lib;

let
  persistence = mkOption {
    default = { };
    type = types.submodule {
      options = {
        directories = mkOption {
          type = types.listOf types.str;
          default = [ ];
        };

        files = mkOption {
          type = types.listOf types.str;
          default = [ ];
        };
      };
    };
    description = ''
      Specify list of directories and files to be persisted in `/nix/data`
    '';
  };
in

{
  options.d.fs = {
    rootOnTmpfs = mkOption {
      type = types.bool;
      default = pkgs.stdenv.isLinux;
      description = ''
        Mount root (`/`) as `tmpfs` (aka in RAM) with limited size (e.g. 2GB)
      '';
    };

    persisted = persistence;
  };

  config = {
    # Easily co-locale apps persistence config when using home-manager
    home-manager.users = {
      ${user}.imports = [{
        options.d.fs = {
          persisted = persistence;
        };
      }];
    };
  };
}
