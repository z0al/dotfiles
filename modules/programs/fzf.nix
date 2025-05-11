{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.fzf;

  fd = lib.getExe pkgs.fd;
in

{
  options.my.programs.fzf = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    theme = mkOption {
      type = types.listOf types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    my.programs.fd.enable = true;

    environment = {
      systemPackages = with pkgs; [
        fzf
      ];

      variables = {
        FZF_DEFAULT_OPTS = lib.concatStringsSep " " (cfg.theme ++ [
          "--exact"
          "--layout=reverse"
          "--inline-info"
          "--height=50%"
          "--scrollbar='┃'"
          "--separator=''"
          "--pointer='┃'"
          "--select-1"
        ]);
        FZF_DEFAULT_COMMAND = "${fd} --type f";
        FZF_CTRL_T_COMMAND = "${fd} --type f";
        FZF_ALT_C_COMMAND = "${fd} --type d";
      };
    };

    my.programs.bash.interactiveShellInit = ''
      eval "$(${lib.getExe pkgs.fzf} --bash)"
    '';

    my.programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.fzf} --fish | source
    '';
  };
}
