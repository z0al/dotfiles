{ pkgs, ... }:

{
  imports = [
    ../modules
    ./hm.nix
    ./nix.nix
    ./pkgs.nix
    ./shells.nix
    ./tmpfs.nix
  ];

  # Fonts
  fonts = {
    fontDir.enable = true;
    # Renamed to packages in NixOS 23.11 but lacks darwin support:
    # https://github.com/LnL7/nix-darwin/issues/752
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
