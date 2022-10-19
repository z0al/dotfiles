{ pkgs-unstable, _, ... }:

{
  services.flameshot = {
    enable = true;
    package = pkgs-unstable.flameshot;

    settings = {
      General = {
        uiColor = "#ffffff";
        contrastUiColor = "#17171F";
        contrastOpacity = 188;

        saveAsFileExtension = ".png";
        savePath = "/home/${_.username}/Pictures";

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
