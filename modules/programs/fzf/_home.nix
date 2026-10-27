{ lib, pkgs, ... }:

let
  fd = lib.getExe pkgs.fd;
in

{
  config = {
    programs.fd.enable = true;

    programs.fzf = {
      enable = lib.mkDefault true;
      enableNushellIntegration = false;

      defaultOptions = [
        "--exact"
        "--layout=reverse"
        "--inline-info"
        "--height=50%"
        "--scrollbar='┃'"
        "--separator=''"
        "--pointer='┃'"
        "--select-1"
      ];

      defaultCommand = "${fd} --type f";
      fileWidget.command = "${fd} --type f";
      changeDirWidget.command = "${fd} --type d";
    };
  };
}
