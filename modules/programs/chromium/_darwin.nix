{ config, lib, ... }:

let
  cfg = config.my.programs.chrome;

  defaultProfile = {
    name = "Chrome Browser";
    domain = "com.google.Chrome";
    payload = cfg.profile;
  };

  extensionProfiles = map (ext: {
    name = "Chrome Browser: ${ext.name}";
    domain = "com.google.Chrome.extensions.${ext.id}";
    payload = ext.settings;
  }) (lib.filter (ext: ext.settings != { }) cfg.extensions);
in

{
  config = {
    homebrew.casks = lib.mkIf cfg.enable [ "google-chrome" ];

    my.deviceManager.profiles = lib.optionals cfg.enable (
      lib.concatLists [
        [ defaultProfile ]
        extensionProfiles
      ]
    );
  };
}
