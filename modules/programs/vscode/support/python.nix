{ config, pkgs, lib, ... }:

let
  cfg = config.d.presets.python;
in

{
  d.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      ms-python.black-formatter
      ms-python.python
      ms-python.vscode-pylance
    ];

    settings = {
      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
      };

      "black-formatter.args" = [ "--line-length" "80" ];
    };
  };
}
