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
      type = types.attrsOf types.anything;
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
      # Transient prompt
      function starship_transient_prompt_func
        # tput cuu1
        starship module directory
        starship module git_branch
        starship module git_state
        starship module git_status
        echo ""
        starship module character
      end

      ${lib.getExe pkgs.starship} init fish | source

      enable_transience

      # https://github.com/starship/starship/issues/560
      function prompt_newline --on-event fish_postexec
        echo
      end

      alias clear "command clear; commandline -f clear-screen"
    '';

    my.hm.config = {
      xdg.configFile."${cfgFile}".source = toTOML "starship.toml" {
        # https://github.com/starship/starship/issues/560
        add_newline = false;

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
