{ config, lib, ... }:

let
  cfg = config.d.wm.focus;
in

{
  config = lib.mkIf (cfg.mode == "sloppy") {
    homebrew. taps = [
      "dimentium/autoraise"
    ];

    homebrew.brews = [{
      name = "autoraise";
      args = [ "with-dexperimental_focus_first" ];
      restart_service = true;
    }];

    # https://github.com/sbmpost/AutoRaise
    my.user.xdg.configFile."AutoRaise/config".text = ''
      delay=10
      focusDelay=1
    '';
  };
}
