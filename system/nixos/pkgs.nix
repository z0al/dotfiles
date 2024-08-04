{ pkgs, ... }:

{
  nixpkgs.hostPlatform = "x86_64-linux";

  environment.systemPackages = with pkgs; [
    # Apps
    blanket
    dialect
    eyedropper
    firefox-devedition-bin
    gnome-obfuscate
    gnome.gnome-tweaks
    gparted
    video-trimmer

    # Other
    binutils
    metadata-cleaner
    newsflash
    polkit
    xclip
    ventoy-full
  ];
}
