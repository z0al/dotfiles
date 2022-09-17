{ config, pkgs, inputs, ... }:

{
  home.packages = [
    pkgs.fd
  ];

  programs.fzf = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;

    defaultCommand = "fd --type f --max-depth 10";
    defaultOptions = [ "--layout=reverse" "--inline-info" "--height=50%" ];
    changeDirWidgetCommand = "fd --type d --max-depth 10";
    fileWidgetCommand = config.programs.fzf.defaultCommand;
  };
}
