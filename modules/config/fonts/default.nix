{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    cascadia-code
    fira-code
    jetbrains-mono

    unstable.nerd-fonts.symbols-only
    noto-fonts-color-emoji
  ];
}
