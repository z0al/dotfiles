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
    # kitty -- see ./kitty
    kitty-themes
    starship
    zoxide
    navi

    # Development
    neovim
    # vscode -- see ./vscode
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
    ;
}
