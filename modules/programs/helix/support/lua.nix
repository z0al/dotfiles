{ config, pkgs, lib, ... }:

let
  cfg = config.d.profiles.dev.lua;
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      lua-language-server
    ];

    languages = {
      language-server.lua-language-server = {
        command = lib.getExe pkgs.lua-language-server;
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
