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

    # Gnome
    gnomeExtensions

    # Apps
    _1password
    _1password-gui
    android-studio
    brave
    eyedropper
    firefox-devedition-bin
    logseq
    zoom-us

    # Other
    nerdfonts
    ;
}
