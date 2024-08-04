{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.helix;
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      nodePackages."@prisma/language-server"
    ];

    languages.language-server.prisma-language-server = {
      command = lib.getExe pkgs.nodePackages."@prisma/language-server";
    };
  };
}

