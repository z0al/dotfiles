{ pkgs, ... }:

{
  # 1password packages are installed system-wide
  # home.packages = with pkgs; [
  #   _1password
  #   _1password-gui
  # ];

  # Configure Git to use 1Password for signing
  programs.git = {
    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICINRjw8qGiYwNcKWWwiqcO1fV1ZbCfrvKBI+i/xjJ0e";
    };

    extraConfig = {
      gpg = {
        format = "ssh";
        ssh.program = "${pkgs._1password-gui}/share/1password/op-ssh-sign";
      };
    };
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "~/.1password/agent.sock";
  };

  programs.ssh.extraConfig = ''
    IdentityAgent ~/.1password/agent.sock
  '';
}
