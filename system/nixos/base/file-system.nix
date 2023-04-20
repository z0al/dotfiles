{ config, pkgs, lib, user, ... }:

with lib;

let
  cfg = config.d.fs;
  cfgHome = config.home-manager.users.${user}.d.fs;

  persistenceOptions = {
    persisted = mkOption {
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
    };
  };

  hmModule = {
    options.d.fs = persistenceOptions;
  };
in

{
  options.d.fs = persistenceOptions // {
    rootOnTmpfs = mkOption {
      type = types.bool;
      default = pkgs.stdenv.isLinux;
    };
  };

  config = {
    home-manager.users = {
      ${user}.imports = [ hmModule ];
    };

    # Temporary root (/)
    fileSystems = mkIf cfg.rootOnTmpfs {
      "/" = {
        device = "none";
        fsType = "tmpfs";
        options = [ "defaults" "size=2G" "mode=755" ];
      };
    };

    # Avoid sudo lectures after each reboot.
    security.sudo.extraConfig = mkIf cfg.rootOnTmpfs ''
      Defaults lecture = never
    '';

    # Persist system state to /nix/data
    environment.persistence."/nix/data" = mkIf cfg.rootOnTmpfs {
      hideMounts = true;

      files = cfg.persisted.files ++ [
        "/etc/machine-id"
      ];

      directories = cfg.persisted.directories ++ [
        "/var/log"
        "/var/lib/bluetooth" # TODO: move to bluetooth.nix or something
        "/var/lib/nixos"
        "/var/lib/systemd/coredump"
        "/etc/NetworkManager/system-connections" # TODO: move to network.nix
        { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
      ];

      users."${user}" = {
        files = cfgHome.persisted.files;
        directories = cfgHome.persisted.directories;
      };
    };
  };
}
