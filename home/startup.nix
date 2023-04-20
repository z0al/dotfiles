{ config, pkgs, lib, ... }:

with lib;

let
  cfg = config.services.startup;

  appModule = types.submodule {
    options = {
      package = mkOption {
        type = types.package;
        description = ''
          Application package to extract the desktop file from.
        '';
      };

      command = mkOption {
        type = types.str;
        default = "";
        description = ''
          The command to set as "Exec" in the desktop file.
        '';
      };
    };
  };

  overrideDesktopEntryExec = entry: cmd:
    if cmd == "" then
      entry
    else
      concatStringsSep "\n"
        (map
          (line:
            if hasPrefix "Exec=" line
            then "Exec=${cmd}"
            else line
          )
          (splitString "\n" entry)
        );
in

{
  options.services.startup = {
    enable = mkOption {
      type = types.bool;
      default = pkgs.stdenv.isLinux;
      description = ''
        Whether to enable managing of startup applications (via XDG Autostart)
      '';
    };

    applications = mkOption {
      type = types.listOf appModule;
      default = [ ];
      description = ''
        List of applications to start on login.
      '';
    };
  };

  config = mkIf cfg.enable {
    xdg.configFile = listToAttrs (map
      (app:
        let
          pkg = app.package;
          cmd = app.command;
          fileName = app.package.pname + ".desktop";
        in
        {
          name = "autostart/${fileName}";
          value = {
            text = overrideDesktopEntryExec
              (readFile "${pkg}/share/applications/${fileName}")
              cmd;
          };
        })
      cfg.applications
    );
  };
}
