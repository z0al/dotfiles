{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Web
    brave

    # Development
    neovim
    nodejs
    python3
    python3.pkgs.pip
    rustc
    sqlite

    # Utils
    binutils
    cargo
    coreutils
    curl
    fd
    fzf
    git
    gnupg
    killall
    kitty
    neofetch
    polkit
    ripgrep
  ];
}