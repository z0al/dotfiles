{ pkgs, ... }:

let
  isDarwin = pkgs.stdenv.hostPlatform.isDarwin;
in

{
  # On NixOS 1password packages are installed on system level
  home.packages = with pkgs; if isDarwin then [
    _1password
    _1password-gui
  ] else [ ];

  # Configure Git to use 1Password for signing
  programs.git = {
    extraConfig = {
      gpg = {
        format = "ssh";
        ssh.program = "${pkgs._1password-gui}/share/1password/op-ssh-sign";
      };
    };
  };

  home.sessionVariables = {
    OP_PLUGIN_ALIASES_SOURCED = 1;
    SSH_AUTH_SOCK = "~/.1password/agent.sock";
  };

  programs.ssh.extraConfig = ''
    IdentityAgent ~/.1password/agent.sock
  '';

  # Autostart in the background
  services.startup.applications = [
    {
      package = pkgs._1password-gui;
      command = "1password --silent";
    }
  ];
}
