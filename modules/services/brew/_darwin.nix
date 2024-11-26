{ config, ... }:

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
    HOMEBREW_NO_ENV_HINTS = "1";
    HOMEBREW_AUTO_UPDATE_SECS = toString (60 * 60 * 24 * 7); # 1 week;
  };

  # Nix Darwin doesn't install homebrew. The following module does.
  nix-homebrew = {
    enable = true;
    autoMigrate = true;
    user = config.d.user.name;
  };
}
