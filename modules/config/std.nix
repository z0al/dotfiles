{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cmake
    coreutils
    curl
    diffutils
    file
    findutils
    gawk
    gcc
    gnugrep
    gnumake
    gnupatch
    gnused
    gnutar
    gzip
    jq
    killall
    less
    lsof
    sqlite
    unzip
  ];
}
