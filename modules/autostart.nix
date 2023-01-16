{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.services.autostart;

  appModule = types.submodule {
    options = {
      package = mkOption {
        type = types.package;
        description = ''
          Application package to extract the desktop file from.
        '';
      };

      exec = mkOption {
        type = types.str;
        description = ''
          The command to set as "Exec" in the desktop file. A %U is appended automatically.
        '';
      };
    };
  };

  writeExecScript = file: exec:
    concatStringsSep "\n" (map
      (line:
        if hasPrefix "Exec=" line
        then "Exec=${exec} %U"
        else line
      )
      (splitString "\n" file)
    );
in

{
  options.services.autostart = {
    enable = mkOption {
      type = types.bool;
      default = true;
      description = ''
        Whether to enable managing of startup applications (via XDG Autostart)
      '';
    };

    applications = mkOption {
      type = types.attrsOf appModule;
      default = { };
      description = ''
        Attribute set of applications to start on login.
      '';
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile =
      mapAttrs
        (_: mod: {
          target = "autostart/${mod.package.pname}.desktop";
          text = writeExecScript
            (readFile "${mod.package}/share/applications/${mod.package.pname}.desktop")
            mod.exec;
        })
        cfg.applications;
  };
}
