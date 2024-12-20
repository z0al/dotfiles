{ config, pkgs, lib, theme, ... }:

let
  cfg = config.d.programs.starship;
  cfgFile = "starship/starship.toml";

  toTOML = (pkgs.formats.toml { }).generate;
in

{
  options.d.programs.starship = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      starship
    ];

    environment.variables = {
      STARSHIP_CONFIG = "${config.my.hm.config.xdg.configHome}/${cfgFile}";
      STARSHIP_LOG = "error";
    };

    d.programs.bash.interactiveShellInit = ''
      eval "$(${lib.getExe pkgs.starship} init bash)"
    '';

    d.programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.starship} init fish | source
    '';

    my.hm.config = {
      xdg.configFile."${cfgFile}".source = toTOML "starship.toml" {
        character = {
          success_symbol = "[](bold purple)";
          error_symbol = "[](bold red)";
          vicmd_symbol = "[](bold purple)";
          vimcmd_replace_symbol = "[](bold red)";
          vimcmd_replace_one_symbol = "[](bold red)";
          vimcmd_visual_symbol = "[](bold yellow)";
        };

        cmd_duration = {
          format = "[$duration]($style)";
        };

        nix_shell = {
          format = "in [$symbol$state(\\($name\\))]($style) ";
          symbol = "❄️ ";
          impure_msg = "";
          pure_msg = "pure ";
        };

        battery.disabled = true;
        docker_context.disabled = true;
        package.disabled = true;
        kubernetes.disabled = false;


        ## Color Palettes
        # Note that there is an extra custom "prompt" attribute added
        # in each palette that's is used in character.* configurations.
        palette = theme;

        # Catppuccin (Mocha)
        # https://github.com/catppuccin/starship
        palettes.catppuccin = {
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
  };
}
