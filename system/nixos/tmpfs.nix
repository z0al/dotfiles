{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.fs;
  cfgHome = config.my.user.d.fs;
in

{
  config = {
    zramSwap.enable = true;
    boot.supportedFilesystems = [ "ntfs" ];

    # Temporary root (/)
    fileSystems = mkIf cfg.rootOnTmpfs {
      "/" = {
        device = "none";
        fsType = "tmpfs";
        options = [ "defaults" "size=4G" "mode=755" ];
      };
    };

    environment.variables = mkIf cfg.rootOnTmpfs {
      DATA = "/nix/data";
    };

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
        { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }

        # TODO: move this out of data dir
        { directory = "/tmp"; mode = "u=rwx,g=rwx,o=rwx"; }
      ];

      users."${user}" = {
        files = cfgHome.persisted.files;
        directories = cfgHome.persisted.directories;
      };
    };
  };
}
