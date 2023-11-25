{
  homebrew = {
    enable = true;
    global.autoUpdate = true;

    casks = [
      "1password"
      "1password-cli"
      "karabiner-elements"
      "raycast"
      "scroll-reverser"
    ];

    taps = [
      "homebrew/cask-versions"
    ];
  };
}
