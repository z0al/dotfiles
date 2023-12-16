{ pkgs, user, ... }:

{
  nixpkgs.hostPlatform = "x86_64-linux";

  # https://1password.community/discussion/comment/638537/#Comment_638537
  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
    _1password-gui.polkitPolicyOwners = [ "root" user ];
  };

  environment.systemPackages = with pkgs; [
    # Apps
    blanket
    dialect
    eyedropper
    firefox-devedition-bin
    gnome-obfuscate
    gnome.gnome-tweaks
    google-chrome
    gparted
    video-trimmer
    wezterm

    # Other
    binutils
    metadata-cleaner
    newsflash
    polkit
    xclip
    ventoy-full
  ];
}
