{ config, lib, ... }:

let
  cfg = config.my.programs.chromium;

  defaultProfile = {
    name = "Chrome Browser";
    domain = "com.google.Chrome";
    payload = cfg.profile;
  };

  extensionProfiles = map
    (ext: {
      name = "Chrome Browser: ${ext.name}";
      domain = "com.google.Chrome.extensions.${ext.id}";
      payload = ext.settings;
    })
    (lib.filter
      (ext: ext.settings != { })
      cfg.extensions);
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "google-chrome"
    ];

    my.deviceManager.profiles = lib.concatLists [
      [ defaultProfile ]
      extensionProfiles
    ];
  };
}
