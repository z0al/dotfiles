{ config, pkgs, ... }:

let
  cfgFonts = config.fonts;
in

{
  config.programs.ghostty = {
    package =
      if pkgs.stdenv.hostPlatform.isDarwin then
        pkgs.ghostty-bin
      else
        pkgs.ghostty;

    settings = {
      theme = "Poimandres";

      font-family = [
        cfgFonts.mono
        cfgFonts.symbol
        cfgFonts.emoji
      ];
      font-size = 14;

      cursor-style = "block";
      cursor-style-blink = true;
      shell-integration-features = "no-cursor";

      window-padding-x = 5;
      window-padding-y = 2;
      confirm-close-surface = false;

      macos-titlebar-style = "transparent";
      macos-titlebar-proxy-icon = "hidden";
      drag-handle = "never";
      macos-option-as-alt = true;
      auto-update = "off";

      keybind = [
        "clear"
        "ctrl+shift+c=copy_to_clipboard"
        "performable:ctrl+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
        "ctrl+shift+n=new_window"
        "ctrl+q=quit"
        "ctrl+shift+r=reload_config"
        "ctrl+shift+f=start_search"
      ];
    };
  };
}
