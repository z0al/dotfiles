{ config, lib, ... }:

let
  cfg = config.programs.coder;

  sshConfig = "${config.home.homeDirectory}/.ssh/coder.conf";
in

{
  options.programs.coder.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs.ssh.includes = [ sshConfig ];

    home.sessionVariables.CODER_SSH_CONFIG_FILE = sshConfig;
  };
}
