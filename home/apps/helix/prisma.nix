{ pkgs, ... }:

let
  pkg = pkgs.nodePackages."@prisma/language-server";
in

{
  home.packages = [ pkg ];

  programs.helix.languages = {
    language = [
      {
        name = "prisma";
        auto-format = true;
      }
    ];

    language-server.prisma-language-server = {
      command = "${pkg}/bin/prisma-language-server";
    };
  };
}
