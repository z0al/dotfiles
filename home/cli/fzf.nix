{ theme, ... }:

let
  themes = {
    # https://github.com/catppuccin/fzf#Mocha
    catppuccin = [
      "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8"
      "--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc"
      "--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    ];
  };
in

{
  programs.fzf = rec {
    enable = true;
    enableFishIntegration = true;

    defaultOptions = themes.${theme} ++ [
      "--layout=reverse"
      "--inline-info"
      "--height=50%"
    ];

    defaultCommand = "fd --type f --max-depth 10";
    changeDirWidgetCommand = "fd --type d --max-depth 10";
    fileWidgetCommand = defaultCommand;
  };
}
