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
          "Hack"
          "JetBrainsMono"
          "Meslo"
          "Noto"
          "SourceCodePro"
          "UbuntuMono"
          "CascadiaCode"
        ];
      })
    ];
  };

  # Localization
  time.timeZone = "Europe/Berlin";
}
