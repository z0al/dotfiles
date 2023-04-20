{ pkgs, ... }:

{
  imports = [
    ./fileSystem.nix
    ./hm.nix
    ./nix.nix
    ./pkgs.nix
    ./shells.nix
  ];

  # Fonts
  fonts = {
    fontDir.enable = true;

    fonts = with pkgs; [
      cascadia-code
      fira-code
      jetbrains-mono
      (nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
        ];
      })
    ];
  };

  # Localization
  time.timeZone = "Europe/Berlin";
}
