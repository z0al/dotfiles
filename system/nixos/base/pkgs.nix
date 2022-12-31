{ pkgs, user, ... }:

{
  # https://1password.community/discussion/comment/638537/#Comment_638537
  programs = {
    _1password.enable = true;
    _1password-gui.enable = true;
    _1password-gui.polkitPolicyOwners = [ "root" user ];
  };

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
