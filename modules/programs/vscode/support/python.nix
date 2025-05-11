{ config, pkgs, lib, ... }:

let
  cfg = config.my.presets.python;
in

{
  my.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      ms-python.black-formatter
      ms-python.python
      # FIXME: re-enable after v25.05
      # ms-python.vscode-pylance
    ];

    settings = {
      "[python]" = {
        "editor.defaultFormatter" = "ms-python.black-formatter";
      };

      "black-formatter.args" = [ "--line-length" "80" ];
    };
  };
}
