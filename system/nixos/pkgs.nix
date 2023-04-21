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
    brave
    dialect
    eyedropper
    firefox-devedition-bin
    gnome-obfuscate
    gnome.gnome-tweaks
    video-trimmer
    warp
    wezterm

    # Other
    binutils
    linux-dynamic-wallpapers
    metadata-cleaner
    newsflash
    polkit
  ];

  # Forcing nix to use /nix/tmp for temporary files
  environment.variables = {
    NIX_REMOTE = "daemon";
  };

  systemd.services.nix-daemon = {
    environment.TMPDIR = "/nix/tmp";
  };

  systemd.tmpfiles.rules = [
    "d /nix/tmp 0755 root root 1d"
  ];
}
