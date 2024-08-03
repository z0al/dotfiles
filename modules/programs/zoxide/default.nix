{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.zoxide;
in

{
  options.d.programs.zoxide = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = lib.mkIf cfg.enable {
    d.programs.fzf.enable = true;

    environment = {
      systemPackages = with pkgs; [
        zoxide
      ];

      shellAliases = {
        j = "__zoxide_zi";
      };
    };

    programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.zoxide} init fish --no-cmd | source
    '';
  };
}
