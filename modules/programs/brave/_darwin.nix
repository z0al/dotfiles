{ config, lib, ... }:

let
  cfg = config.my.programs.brave;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "brave-browser"
    ];

    my.deviceManager.profiles = [{
      name = "Brave Browser";
      domain = "com.brave.Browser";
      payload = lib.removeAttrs cfg.profile [
        "DefaultSearchProviderEnabled"
        "DefaultSearchProviderKeyword"
        "DefaultSearchProviderName"
        "DefaultSearchProviderSearchURL"
        "HomepageIsNewTabPage"
        "RestoreOnStartup"
        "SiteSearchSettings"
      ];
    }];
  };
}
