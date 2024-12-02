{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.flameshot;

  toIni = (pkgs.formats.ini { }).generate;
in

{
  options.d.programs.flameshot = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      flameshot
    ];

    my.hm.config.xdg.configFile."flameshot/flameshot.ini" = {
      source = toIni "flameshot.ini" {
        General = {
          uiColor = "#ffffff";
          contrastUiColor = "#17171F";
          contrastOpacity = 188;

          saveAsFileExtension = ".png";
          savePath = "${config.my.user.home}/Pictures";

          showHelp = false;
          startupLaunch = false;
          checkForUpdates = false;
          disabledTrayIcon = false;
          showSidePanelButton = false;
          showDesktopNotification = false;
          showStartupLaunchMessage = false;
        };
      };
    };
  };
}
