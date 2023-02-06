{ pkgs, user, ... }:

{
  # https://1password.community/discussion/comment/638537/#Comment_638537
  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
    _1password-gui.polkitPolicyOwners = [ "root" user ];
  };

  environment.systemPackages = with pkgs; [
    # Apps
    brave
    dialect
    eyedropper
    firefox-devedition-bin
    gnome-obfuscate
    gnome.gnome-tweaks
    kitty
    video-trimmer
    warp

    # Other
    linux-dynamic-wallpapers
    metadata-cleaner
    newsflash
    polkit
  ];
}
