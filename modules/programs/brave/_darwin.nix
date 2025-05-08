{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.brave;

  profile = pkgs.writeText "brave-browser.plist" (
    lib.generators.toPlist { } cfg.profile
  );

  prefix = "/Library/Managed Preferences";
  target = "com.brave.Browser.plist";
in

{
  config = lib.mkIf cfg.enable {
    launchd.daemons."com.nix.managed.brave" = {
      script = ''
        set -euo pipefail

        dir=${lib.escapeShellArg prefix}
        mkdir -p "$dir"

        cd "$dir"
        cp ${profile} "${target}"
        chmod 644 "${target}"
      '';

      serviceConfig = {
        KeepAlive = true;
        RunAtLoad = true;
      };
    };
  };
}
