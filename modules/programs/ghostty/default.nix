{ config, lib, ... }:

let
  cfg = config.d.programs.ghostty;
in

{
  options.d.programs.ghostty = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    theme = mkOption {
      type = types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    # TODO: waiting for https://github.com/NixOS/nixpkgs/pull/368404
    # environment.systemPackages = with pkgs; [
    #   ghostty
    # ];

    my.hm.config.xdg.configFile."ghostty/config".text = ''
      theme = ${cfg.theme}
    '';
  };
}
