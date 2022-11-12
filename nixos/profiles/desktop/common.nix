{ pkgs, ... }:

{
  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  i18n.defaultLocale = "en_US.UTF-8";

  # Hardware
  hardware = {
    bluetooth.enable = true;
    video.hidpi.enable = true;

    # For MX Master 3 and others
    logitech.wireless = {
      enable = true;
      enableGraphical = true;
    };
  };

  # Fonts
  fonts = {
    enableDefaultFonts = true;

    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "Ubuntu"
          "UbuntuMono"
        ];
      })
    ];
  };

  # Localization
  time.timeZone = "Europe/Berlin";
}
