channels: final: prev: {
  __dontExport = true;

  # Use the latest version for the following packages
  inherit (channels.unstable)
    # NixOS
    nix-ld

    # Terminal
    bat
    fd
    fzf
    starship
    zoxide
    navi
    wezterm

    # Development
    neovim
    vscode
    vscode-extensions

    # Apps
    _1password
    _1password-gui
    android-studio
    brave
    firefox-devedition-bin
    obsidian
    zoom-us

    # Other
    nerdfonts
    ;
}
