{ config, lib, ... }:

let
  cfg = config.my.style;

  titleCase = "Catppuccin Mocha";
  snakeCase = "catppuccin_mocha";
  kebabCase = "catppuccin-mocha";
in

{
  config = lib.mkIf (cfg.theme == "catppuccin") {
    my.programs = {
      bat.theme = kebabCase;
      ghostty.theme = kebabCase;
      helix.theme = snakeCase;
      vscode.theme = titleCase;
      wezterm.theme = titleCase;

      # https://github.com/catppuccin/fzf#Mocha
      fzf.theme = [
        "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,gutter:#1e1e2e"
        "--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc"
        "--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
      ];

      # https://github.com/catppuccin/starship
      starship.theme = {
        rosewater = "#f5e0dc";
        flamingo = "#f2cdcd";
        pink = "#f5c2e7";
        mauve = "#cba6f7";
        red = "#f38ba8";
        maroon = "#eba0ac";
        peach = "#fab387";
        yellow = "#f9e2af";
        green = "#a6e3a1";
        teal = "#94e2d5";
        sky = "#89dceb";
        sapphire = "#74c7ec";
        blue = "#89b4fa";
        lavender = "#b4befe";
        text = "#cdd6f4";
        subtext1 = "#bac2de";
        subtext0 = "#a6adc8";
        overlay2 = "#9399b2";
        overlay1 = "#7f849c";
        overlay0 = "#6c7086";
        surface2 = "#585b70";
        surface1 = "#45475a";
        surface0 = "#313244";
        base = "#1e1e2e";
        mantle = "#181825";
        crust = "#11111b";
      };
    };
  };
}
