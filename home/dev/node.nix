{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    nodePackages_latest.prettier
    fnm
  ];

  home.shellAliases = {
    nvm = "fnm";
  };

  programs.bash.initExtra = ''
    eval "$(fnm env --use-on-cd)"
  '';

  programs.fish.interactiveShellInit = ''
    fnm env --use-on-cd | source
  '';
}
