{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    dialect
    eyedropper
    gnome-obfuscate
    linux-dynamic-wallpapers
    metadata-cleaner
    newsflash
    video-trimmer
    warp
  ];
}
