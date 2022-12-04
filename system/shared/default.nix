{ pkgs, ... }:

{
  imports = [
    ./hm.nix
    ./nix.nix
    ./pkgs.nix
    ./shells.nix
  ];

  system.stateVersion = "22.11";

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
