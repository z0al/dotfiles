{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.flameshot;
in

{
  options.d.apps.flameshot = {
    enable = mkOption {
      type = types.bool;
      default = pkgs.stdenv.isLinux;
    };
  };

  config = {
    services.flameshot = {
      enable = cfg.enable;

      settings = {
        General = {
          uiColor = "#ffffff";
          contrastUiColor = "#17171F";
          contrastOpacity = 188;

          saveAsFileExtension = ".png";
          savePath = "${config.home.homeDirectory}/Pictures";

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
