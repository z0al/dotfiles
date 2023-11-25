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
    # Renamed to packages in 23.11
    fonts = with pkgs; [
      cascadia-code
      fira-code
      jetbrains-mono
      powerline-symbols
      # Renamed to noto-fonts-color-emoji in 23.11
      noto-fonts-emoji
      (nerdfonts.override {
        fonts = [
          "NerdFontsSymbolsOnly"
        ];
      })
    ];
  };

  # Localization
  time.timeZone = "Europe/London";
}
