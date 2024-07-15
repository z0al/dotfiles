{ config, lib, ... }:

let
  cfg = config.d.programs.homebrew;

  updateInterval = 60 * 60 * 24 * 7; # 1 week
in

{
  config = lib.mkIf cfg.enable {
    homebrew = with cfg; {
      inherit brews casks taps;

      enable = true;
      onActivation = {
        autoUpdate = true;
        upgrade = true;
        cleanup = "uninstall";
      };
    };

    my.user.home.sessionVariables = {
      HOMEBREW_AUTO_UPDATE_SECS = toString updateInterval;
    };
  };
}
