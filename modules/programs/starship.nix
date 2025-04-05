{ config, pkgs, lib, ... }:

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

    theme = mkOption {
      type = types.attrs;
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
        dotnet.disabled = true;


        ## Color Palettes
        palette = "custom";
        palettes.custom = cfg.theme;
      };
    };
  };
}
