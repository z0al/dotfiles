{ config, pkgs, lib, ... }:

let
  cfg = config.d.presets.lua;
  package = pkgs.lua-language-server;
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = [ package ];

    languages = {
      language-server.lua-language-server = {
        command = lib.getExe package;
      };

      language = [{
        name = "lua";
        indent = {
          tab-width = 2;
          unit = "\t";
        };

        formatter = {
          command = lib.getExe pkgs.stylua;
          args = lib.flatten [
            [ "-" ]

            # Formating Options:
            [ "--column-width" "80" ]
            [ "--indent-type" "Tabs" ]
            [ "--indent-width" "2" ]
            [ "--sort-requires" ]
          ];
        };
      }];
    };
  };
}
