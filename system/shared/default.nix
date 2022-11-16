{ pkgs, ... }:

{
  imports = [
    ./nix.nix
    ./pkgs.nix
    ./shells.nix
  ];

  system.stateVersion = "22.05";

  # Fonts
  fonts = {
    fontDir.enable = true;

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
