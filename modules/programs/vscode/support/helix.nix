{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.vscode;
in

{
  my.programs.vscode = lib.mkIf cfg.enable {
    extensions = with pkgs.vscode-marketplace; [
      jasew.vscode-helix-emulation
      wenfangdu.jump
    ];

    settings = {
      "extensions.experimental.affinity" = {
        "jasew.vscode-helix-emulation" = 1;
      };

      "jump.display.color" = "#000";
      "jump.display.backgroundColor" = "#ff0";
    };

    keybindings = [
      {
        key = "g w";
        command = "jump-extension.jump-to-the-start-of-a-word";
        when = lib.concatStringsSep " && " [
          "editorTextFocus"
          "extension.helixKeymap.normalMode"
        ];
      }
    ];
  };
}
