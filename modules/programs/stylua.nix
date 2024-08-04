{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.stylua;
in

{
  options.d.programs.stylua = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.lua.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      stylua
    ];
  };
}
