{ config, ... }:

{
  services.flameshot = {
    enable = true;

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
}
