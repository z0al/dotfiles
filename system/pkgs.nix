{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim-unwrapped
    wezterm

    # Langauges
    python3
    python3.pkgs.pip
    rustc
    sqlite

    # Utils
    cargo
    cmake
    coreutils
    curl
    fd
    file
    fzf
    git
    gcc
    gnupg
    gnumake
    killall
    lsof
    neofetch
    ripgrep
    unzip
  ];
}
