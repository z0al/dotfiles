{ config, lib, ... }:

let
  cfg = config.my.programs._1password;
in

{
  config = lib.mkIf cfg.enable {
    # https://1password.community/discussion/comment/638537/#Comment_638537
    programs = {
      _1password.enable = true;

      _1password-gui = {
        enable = true;
        polkitPolicyOwners = [
          "root"
          config.my.user.name
        ];
      };
    };
  };
}
