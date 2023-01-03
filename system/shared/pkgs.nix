{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Web
    brave
    firefox-devedition-bin

    # Development
    neovim-unwrapped
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
    kitty
    lsof
    neofetch
    polkit
    ripgrep
  ];
}
