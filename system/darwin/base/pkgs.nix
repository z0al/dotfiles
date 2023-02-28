{
  homebrew = {
    enable = true;
    global.autoUpdate = false;

    casks = [
      "1password"
      "1password-cli"
    ];

    taps = [
      "homebrew/cask-versions"
    ];
  };
}
