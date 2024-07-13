{ pkgs, ... }:

{
  imports = [
    ./hm.nix
    ./pkgs.nix
    ./shells.nix
    ./tmpfs.nix
  ];

  # Fonts
  fonts = {
    packages = with pkgs.latest; [
      cascadia-code
      fira-code
      jetbrains-mono
      powerline-symbols
      noto-fonts-color-emoji
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
