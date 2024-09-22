{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "uninstall";
    };

    taps = [
      "homebrew/services"
    ];
  };

  environment.variables = {
    HOMEBREW_AUTO_UPDATE_SECS = toString (60 * 60 * 24 * 7); # 1 week;
  };

  environment.interactiveShellInit = ''
    if [ -f /opt/homebrew/bin/brew ]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
  '';
}
