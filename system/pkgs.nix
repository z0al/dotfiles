{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    helix
    wezterm

    # Langauges
    python3
    python3.pkgs.pip

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
