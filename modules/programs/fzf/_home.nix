{ lib, pkgs, ... }:

let
  fd = lib.getExe pkgs.fd;
in

{
  config.programs.fd.enable = true;

  config.programs.fzf = {
    enable = lib.mkDefault true;

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
    fileWidgetCommand = "${fd} --type f";
    changeDirWidgetCommand = "${fd} --type d";
  };
}
