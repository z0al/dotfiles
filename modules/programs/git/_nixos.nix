{ config, lib, ... }:

let
  cfg = config.dot.programs.git;
in

{
  config = lib.mkIf cfg.enable {
    environment.shellAliases = {
      g = "git status";
      gcm = "git commit -m";
      gp = "git pull";
      gP = "git push";
    };
  };
}
