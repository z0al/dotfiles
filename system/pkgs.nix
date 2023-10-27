{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
    wezterm

    # Langauges
    python3
    python3.pkgs.pip
    sqlite

    # Utils
    cmake
    coreutils
    curl
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
    unzip
  ];
}
