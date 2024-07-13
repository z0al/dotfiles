{ pkgs, ... }:

{
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
}
