{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim-unwrapped
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
    killall
    lsof
    neofetch
    ripgrep
    unzip
  ];
}
