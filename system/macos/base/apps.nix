{
  homebrew = {
    enable = true;
    global.autoUpdate = false;

    casks = [
      "brave-browser"
      "firefox-developer-edition"
      "kitty"
      "visual-studio-code"
      "wezterm"
    ];

    taps = [
      "homebrew/cask-versions"
    ];
  };
}
