{ pkgs, ... }:

{
  imports = [
    ./hm.nix
    ./nix.nix
    ./pkgs.nix
    ./shells.nix
  ];

  # Fonts
  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "FiraCode"
        ];
      })
    ];
  };

  # Localization
  time.timeZone = "Europe/Berlin";
}
