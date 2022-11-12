{
  environment.systemPackages = with pkgs; [
    # Essentials
    binutils
    brave
    curl
    fd
    fzf
    git
    gnupg
    jq
    killall
    neofetch
    neovim
    ripgrep

    ## Languages
    cargo
    rustc
    nodejs
    python3
    python3.pkgs.pip

    # Other
    sqlite
  ];
}
