{ pkgs, ... }:

let
  mod = if pkgs.stdenv.hostPlatform.isDarwin then "cmd" else "ctrl";
in

{
  programs.zed-editor.userKeymaps = [
    {
      context = "!SettingsWindow";
      bindings = {
        "${mod}-," = "zed::OpenSettingsFile";
      };
    }
  ];
}
