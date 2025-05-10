{ config, lib, ... }:

{
  imports = [
    (lib.mkAliasOptionModule
      [ "hm" ]
      [ "home-manager" "users" config.d.user.name ])
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };

  environment.variables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
  };

  hm = {
    home = {
      username = config.my.user.name;
      homeDirectory = config.my.user.home;
      stateVersion = config.d.version;
    };

    xdg.enable = true;
    programs.ssh.enable = true;
    programs.home-manager.enable = true;
  };
}
