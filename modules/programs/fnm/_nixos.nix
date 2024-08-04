{ config, lib, ... }:

let
  cfg = config.d.programs.fnm;
in

{
  config = lib.mkIf cfg.enable {
    d.fs.persisted = {
      directories = [
        "~/.npm"
      ];

      files = [
        "~/.npmrc"
        "~/.yarnrc"
      ];
    };
  };
}
