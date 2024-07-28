{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
    wezterm

    # Utils
    cmake
    coreutils
    curl
    entr
    fd
    file
    fzf
    gcc
    git
    gnumake
    gnupg
    httpie
    killall
    lsof
    neofetch
    ripgrep
    sqlite
    unzip
  ];
}
