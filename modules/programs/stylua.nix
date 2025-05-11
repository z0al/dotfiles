{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.stylua;
in

{
  options.my.programs.stylua = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.lua.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      stylua
    ];
  };
}
