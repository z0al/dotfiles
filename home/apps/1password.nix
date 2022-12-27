{ pkgs, ... }:

{
  home.packages = with pkgs; [
    _1password
    _1password-gui
  ];

  programs.git.extraConfig = {
    credential.helper = "!git-credential-1password";
  };
}
