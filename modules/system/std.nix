{ config, pkgs, lib, ... }:

let
  cfg = config.d.std;
in

{
  options.d.std = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      cmake
      coreutils
      curl
      diffutils
      file
      findutils
      gawk
      gcc
      gnugrep
      gnumake
      gnupatch
      gnused
      gnutar
      gzip
      jq
      killall
      lsof
      sqlite
      unzip
    ];
  };
}
