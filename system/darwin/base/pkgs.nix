{
  homebrew = {
    enable = true;
    global.autoUpdate = false;

    casks = [
      "1password"
      "1password-cli"
      "karabiner-elements"
      "scroll-reverser"
    ];

    taps = [
      "homebrew/cask-versions"
    ];
  };
}
