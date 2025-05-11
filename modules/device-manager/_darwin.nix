{ config, pkgs, lib, ... }:

let
  cfg = config.d.deviceManager;

  identifier = "com.nix.managed.profile";

  nixProfile = lib.generators.toPlist { } {
    PayloadDisplayName = "Nix Profile";
    PayloadUUID = identifier;
    PayloadIdentifier = identifier;
    PayloadOrganization = config.my.user.name;
    PayloadType = "Configuration";
    PayloadVersion = 1;
    PayloadContent = map
      (profile: profile.payload // {
        PayloadDisplayName = profile.name;
        PayloadUUID = profile.domain;
        PayloadIdentifier = profile.domain;
        PayloadType = profile.domain;
        PayloadVersion = 1;
      })
      cfg.profiles;
  };

  warn = "${lib.getExe pkgs.gum} style --foreground 3";
in

{
  options.d.deviceManager = with lib; {
    profiles = mkOption {
      type = types.listOf
        (types.submodule {
          options = {
            name = mkOption {
              type = types.str;
              example = "Google Chrome";
            };

            domain = mkOption {
              type = types.str;
              example = "com.google.Chrome";
            };

            payload = mkOption {
              type = types.attrsOf types.anything;
            };
          };
        });

      default = [
        {
          name = "placeholder";
          domain = "com.placeholder";
          payload = { };
        }
      ];
    };
  };

  config = {
    hm.home.file."nix.mobileconfig" = {
      text = nixProfile;
      force = true;
      onChange = ''
        ${warn} "Device Manager: ~/nix.mobileconfig has chanaged. Install the \
        profile via system preferences for changes to take affect"
      '';
    };
  };
}
