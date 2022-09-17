{ config, pkgs, inputs, ... }:

{
  imports = [
    ./themes/catppuccin.nix
  ];

  programs.fzf = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;

    defaultOptions = [
      "--layout=reverse"
      "--inline-info"
      "--height=50%"
    ];

    defaultCommand = "fd --type f --max-depth 10";
    changeDirWidgetCommand = "fd --type d --max-depth 10";
    fileWidgetCommand = config.programs.fzf.defaultCommand;
  };
}
