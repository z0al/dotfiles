{
  homebrew = {
    enable = true;
    global.autoUpdate = false;

    brews = [ ];
    casks = [
      "1password"
      "1password-cli"
    ];

    taps = [
      "homebrew/cask-versions"
    ];
  };
}
