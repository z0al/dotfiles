final: prev: {
  __dontExport = true;

  # Use the latest version for the following packages
  inherit (final.unstable)
    # NixOS
    nix-ld

    # Terminal
    bat
    fd
    fzf
    navi
    starship
    wezterm
    zoxide

    # Development
    bun
    nodePackages
    stylua
    vscode
    vscode-extensions

    # Apps
    _1password
    _1password-gui
    android-studio
    firefox-devedition-bin
    obsidian
    zoom-us

    # Other
    nerdfonts
    ;
}
