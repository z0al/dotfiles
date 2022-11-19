{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # dialect
    gnome-obfuscate
    linux-dynamic-wallpapers
    metadata-cleaner
    newsflash
    # video-trimmer
    # warp
  ];
}
