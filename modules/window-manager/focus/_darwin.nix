{ config, pkgs, lib, ... }:

let
  cfg = config.d.windowManager.focus;

  sloppy = cfg.mode == "sloppy";
in

{
  # Click mode (Default)
  # Nothing to configure but we may as well terminate AutoRaise if previously
  # enabled.
  d.run.stopAutoRaise = lib.mkIf (cfg.mode == "click") ''
    ${lib.getExe pkgs.killall} AutoRaise &> /dev/null || true
  '';

  # Sloppy mode
  # Focus follows mouse pointer instantly. A slight delay is introduced before
  # raising the window for a less jarring experience.
  homebrew.taps = lib.mkIf sloppy [
    "dimentium/autoraise"
  ];

  homebrew.brews = lib.mkIf sloppy [{
    name = "autoraise";
    args = [ "with-dexperimental_focus_first" ];
    restart_service = true;
  }];

  # https://github.com/sbmpost/AutoRaise
  my.user.xdg = lib.mkIf sloppy {
    configFile."AutoRaise/config".text = ''
      delay=10
      focusDelay=1
    '';
  };
}
