{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.apps.flameshot;

  ini = pkgs.formats.ini { };

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
in

{
  options.d.apps.flameshot = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      flameshot
    ];

    xdg.configFile."flameshot/flameshot.ini" = {
      source = ini.generate "flameshot.ini" settings;
    };
  };
}
