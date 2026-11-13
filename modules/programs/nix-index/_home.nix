{ config, lib, ... }:

let
  cfg = config.programs.nix-index;
in

{
  config = lib.mkIf cfg.enable {
    programs.nix-index-database.comma.enable = true;
  };
}
