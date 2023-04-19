{
  homebrew = {
    enable = true;
    global.autoUpdate = false;

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
