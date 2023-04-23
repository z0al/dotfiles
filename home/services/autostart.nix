{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.d.autostart;
in

{
  options.d.autostart = mkOption {
    type = types.attrsOf
      (types.submodule {
        options = {
          exec = mkOption { type = types.str; };
        };
      });
    default = { };
  };

  config = {
    systemd.user.services = mapAttrs
      (name: opts: {
        Service = {
          Type = "simple";
          Restart = "always";
          RestartSec = 1;
          ExecStart = "${pkgs.${name}}/bin/${opts.exec}";
        };

        Install = {
          WantedBy = [ "graphical-session.target" ];
        };
      })
      cfg;
  };
}
