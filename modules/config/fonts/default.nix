{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    cascadia-code
    fira-code
    jetbrains-mono

    nerd-fonts.symbols-only
    noto-fonts-color-emoji
  ];
}
