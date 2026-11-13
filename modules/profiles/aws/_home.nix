{ config, lib, ... }:

let
  cfg = config.profiles.aws;
in

{
  options.profiles.aws.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs.awscli.enable = lib.mkDefault true;
  };
}
