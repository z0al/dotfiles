{ pkgs, ... }:

let
  sign =
    if pkgs.stdenv.isDarwin then
      "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
    else
      "${pkgs._1password-gui}/share/1password/op-ssh-sign";

  agent =
    if pkgs.stdenv.isDarwin then
      "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    else
      "~/.1password/agent.sock";
in

{
  # Configure Git to use 1Password for signing
  # Note: 1password packages are installed on system level
  programs.git = {
    extraConfig = {
      gpg = {
        format = "ssh";
        ssh.program = sign;
      };
    };
  };

  home.sessionVariables = {
    OP_PLUGIN_ALIASES_SOURCED = 1;
    SSH_AUTH_SOCK = agent;
  };

  programs.ssh.extraConfig = ''
    IdentityAgent "${agent}"
  '';

  # Autostart in the background
  services.startup.applications = [
    {
      package = pkgs._1password-gui;
      command = "1password --silent";
    }
  ];
}
