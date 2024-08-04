{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.helix;

  json-lang-server-bin = with pkgs;
    "${vscode-langservers-extracted}/bin/vscode-json-language-server";
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      vscode-langservers-extracted
    ];

    languages = {
      language = [{
        name = "json";

        indent = {
          tab-width = 2;
          unit = "\t";
        };

        language-servers = [ "vscode-json-language-server" ];
      }];

      language-server = {
        vscode-json-language-server.command = json-lang-server-bin;
      };
    };
  };
}
