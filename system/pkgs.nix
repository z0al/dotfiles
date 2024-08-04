{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Utils
    cmake
    coreutils
    curl
    entr
    file
    gcc
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
