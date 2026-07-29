{ config, lib, ... }:

let
  cfg = config.my.programs.safari;
in

{
  config = lib.mkIf cfg.enable {
    plist.safari = {
      devTools.enable = true;
    };

    system.defaults.CustomUserPreferences."com.apple.Safari.SandboxBroker" =
      {
        AutoFillPasswords = false;
        AutoFillCreditCardData = false;
      };
  };
}
