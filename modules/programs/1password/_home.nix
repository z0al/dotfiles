{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.programs._1password;

  # https://developer.1password.com/docs/ssh/get-started/
  ssh = with pkgs.stdenv; {
    agent =
      if isDarwin then
        "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
      else
        "${config.home.homeDirectory}/.1password/agent.sock";

    sign =
      if isDarwin then
        "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
      else
        "${pkgs._1password-gui}/share/1password/op-ssh-sign";
  };

  pluginsFile = "~/.config/op/plugins.sh";
in

{
  options.programs._1password.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      # HM's ssh_config generator doesn't quote directive values, so
      # spaces in the path (e.g. "Group Containers" on darwin) would
      # otherwise break parsing. Quote it ourselves.
      settings."*".identityAgent = ''"${ssh.agent}"'';
    };

    programs.git.settings = {
      gpg.ssh.program = ssh.sign;
    };

    programs.bash.initExtra = ''
      if [ -f ${pluginsFile} ]; then
        source ${pluginsFile}
      fi
    '';

    programs.fish.interactiveShellInit = ''
      if test -f ${pluginsFile}
        source ${pluginsFile}
      end
    '';
  };
}
