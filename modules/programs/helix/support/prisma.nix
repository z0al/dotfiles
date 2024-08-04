{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.helix;
  package = pkgs.unstable.nodePackages."@prisma/language-server";
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = [ package ];

    languages.language-server.prisma-language-server = {
      command = lib.getExe package;
    };
  };
}

