{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    casks = [
      # https://github.com/NixOS/nixpkgs/issues/254944
      "1password"
      "1password-cli"
      "docker"
      "google-chrome"
      "raycast"
      "scroll-reverser"
    ];

    taps = [
      "homebrew/cask-versions"
    ];
  };
}
