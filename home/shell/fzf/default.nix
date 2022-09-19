{ config, pkgs-unstable, _, ... }:

{
  imports = [
    (./themes + "/${_.theme}.nix")
  ];

  programs.fzf = {
    enable = true;
    package = pkgs-unstable.fzf;

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
