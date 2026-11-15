{ config, lib, ... }:

let
  cfg = config.profiles.codex;
in

{
  options.profiles.codex.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };

  config = lib.mkIf cfg.enable {
    programs = {
      chatgpt.enable = lib.mkDefault true;
      codex.enable = lib.mkDefault true;
    };
  };
}
