{ config, lib, ... }:

let
  cfg = config.profiles.terraform;
in

{
  options.profiles.terraform.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs.terraform.enable = lib.mkDefault true;
  };
}
