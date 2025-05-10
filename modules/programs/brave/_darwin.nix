{ config, lib, ... }:

let
  cfg = config.d.programs.brave;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "brave-browser"
    ];

    d.mdm.profiles = [{
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
