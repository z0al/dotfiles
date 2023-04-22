{ pkgs, ... }:

{
  imports = [
    ./file-system.nix
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
      powerline-symbols
      noto-fonts-emoji
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
