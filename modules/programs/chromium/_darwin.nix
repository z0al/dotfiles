{ config, lib, ... }:

let
  cfg = config.my.programs.chromium;
in

{
  config = lib.mkIf cfg.enable {
    homebrew.casks = [
      "google-chrome"
    ];

    my.deviceManager.profiles = [{
      name = "Chrome Browser";
      domain = "com.google.Chrome";
      payload = cfg.profile;
    }];
  };
}
