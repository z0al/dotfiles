{ config, lib, ... }:

let
  cfg = config.d.programs._1password;
in

{
  config = lib.mkIf cfg.enable {
    # https://1password.community/discussion/comment/638537/#Comment_638537
    programs = {
      _1password.enable = true;

      _1password-gui = {
        enable = true;
        polkitPolicyOwners = [ "root" config.d.user.name ];
      };
    };

    d.fs.persisted = {
      directories = [
        "~/.config/op"
        "~/.config/1Password/settings"
      ];

      files = [
        "~/.config/1Password/1password.sqlite"
      ];
    };
  };
}
