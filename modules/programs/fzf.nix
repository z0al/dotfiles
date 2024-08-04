{ config, pkgs, lib, theme, ... }:

let
  cfg = config.d.programs.fzf;

  themes = {
    # https://github.com/catppuccin/fzf#Mocha
    catppuccin = [
      "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8,gutter:#1e1e2e"
      "--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc"
      "--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
    ];
  };

  fd = lib.getExe pkgs.fd;
in

{
  options.d.programs.fzf = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    d.programs.fd.enable = true;

    environment = {
      systemPackages = with pkgs; [
        fzf
      ];

      variables = {
        FZF_DEFAULT_OPTS = lib.concatStringsSep " " (themes.${theme} ++ [
          "--layout=reverse"
          "--inline-info"
          "--height=50%"
          "--scrollbar='┃'"
          "--separator=''"
          "--pointer='┃'"
        ]);
        FZF_DEFAULT_COMMAND = "${fd} --type f";
        FZF_CTRL_T_COMMAND = "${fd} --type f";
        FZF_ALT_C_COMMAND = "${fd} --type d";
      };
    };

    d.programs.fish.init = ''
      ${lib.getExe pkgs.fzf} --fish | source
    '';
  };
}
