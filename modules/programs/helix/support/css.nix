{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.helix;

  css-lang-server-bin = with pkgs;
    "${vscode-langservers-extracted}/bin/vscode-css-language-server";
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    packages = with pkgs; [
      vscode-langservers-extracted
    ];

    languages = {
      language = [{
        name = "css";

        indent = {
          tab-width = 2;
          unit = "\t";
        };

        language-servers = [ "vscode-css-language-server" ];
      }];

      language-server = {
        vscode-css-language-server.command = css-lang-server-bin;
      };
    };
  };
}
