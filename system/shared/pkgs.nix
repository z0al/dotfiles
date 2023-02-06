{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Langauges
    python3
    python3.pkgs.pip
    rustc
    sqlite

    # Utils
    binutils
    cargo
    cmake
    coreutils
    curl
    fd
    fzf
    git
    gcc
    gnupg
    gnumake
    killall
    lsof
    neofetch
    ripgrep
  ];
}
