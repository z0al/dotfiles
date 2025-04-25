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
  };

  # Nix Darwin doesn't install homebrew. The following module does.
  nix-homebrew = {
    enable = true;
    autoMigrate = true;
    user = config.d.user.name;
  };
}
