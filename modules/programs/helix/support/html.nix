{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.helix;

  html-lang-server-bin = with pkgs;
    "${vscode-langservers-extracted}/bin/vscode-html-language-server";
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      vscode-langservers-extracted
    ];

    languages = {
      language = [{
        name = "html";

        indent = {
          tab-width = 2;
          unit = "\t";
        };

        language-servers = [ "vscode-html-language-server" ];
      }];

      language-server = {
        vscode-html-language-server.command = html-lang-server-bin;
      };
    };
  };
}
