channels: final: prev: {
  __dontExport = true;

  # Use the latest version for the following packages
  inherit (channels.unstable)
    # Terminal
    bat
    fd
    fzf
    kitty
    kitty-themes
    starship
    zoxide
    navi

    # Development
    neovim
    vscode

    # Gnome
    gnomeExtensions

    # Apps
    _1password
    _1password-gui
    android-studio
    brave
    firefox-devedition-bin
    logseq
    zoom-us
    ;
}
