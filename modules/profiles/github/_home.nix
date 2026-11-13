{ config, lib, ... }:

let
  cfg = config.profiles.github;
in

{
  options.profiles.github.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs.gh.enable = lib.mkDefault true;
  };
}
