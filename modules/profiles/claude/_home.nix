{ config, lib, ... }:

let
  cfg = config.profiles.claude;
in

{
  options.profiles.claude.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      claude.enable = lib.mkDefault true;
      claude-code.enable = lib.mkDefault true;
    };
  };
}
