{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs._1password;

  # https://developer.1password.com/docs/ssh/get-started/
  ssh = with pkgs.stdenv; {
    agent =
      if isDarwin then
        "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      else
        "~/.1password/agent.sock";

    sign =
      if isDarwin then
        "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
      else
        "${pkgs._1password-gui}/share/1password/op-ssh-sign";
  };
in

{
  options.d.programs._1password = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.interactiveShellInit = ''
      if [ -f ~/.config/op/plugins.sh ]; then
        source ~/.config/op/plugins.sh
      fi
    '';

    my.hm.config = {
      programs.ssh.extraConfig = ''
        IdentityAgent "${ssh.agent}"
      '';

      # Git Intergration
      programs.git.extraConfig.gpg = {
        format = "ssh";
        ssh.program = ssh.sign;
      };
    };
  };
}
