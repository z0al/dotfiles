{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.brave;

  # /Library/Managed Preferences/*.plist gets removed on every reboot, causing
  # Brave to miss the extension list and, as a result, wipe existing extension
  # data if the launchd daemon hasn't recreated the file yet. To avoid this,
  # we use external extensions in macOS.
  #
  # The files are likely removed because they weren't created through a proper
  # MDM (Mobile Device Management) solution using a macOS profile, etc.
  #
  # Ref:
  # https://developer.chrome.com/docs/extensions/how-to/distribute/install-extensions
  profileWithoutExtensions = lib.removeAttrs cfg.profile [
    "ExtensionInstallForcelist"
    "ExtensionSettings"
  ];

  profile = pkgs.writeText "brave-browser.plist" (
    lib.generators.toPlist { } profileWithoutExtensions
  );

  extensionFileTemplate = pkgs.writeText "brave-external-extension.json" (
    builtins.toJSON {
      external_update_url = "https://clients2.google.com/service/update2/crx";
    }
  );

  bravePolicyDir = "/Library/Managed Preferences";
  braveConfigDir = "/Library/Application Support/BraveSoftware/Brave-Browser";
in

{
  config = lib.mkIf cfg.enable {
    launchd.daemons."com.nix.managed.brave" = {
      script = ''
        set -euo pipefail

        # Managed Preferences
        pref="${bravePolicyDir}"
        mkdir -p "$pref" && cd "$pref"

        cp ${profile} "com.brave.Browser.plist"
        chmod 644 "com.brave.Browser.plist"

        # External Extensions
        ext="${braveConfigDir}/External Extensions"
        mkdir -p "$ext" && cd "$ext"

        ${lib.concatLines
          (map
            (ext: ''
              cp "${extensionFileTemplate}" "${ext.id}.json"
              chmod 644 "${ext.id}.json"
            '')
            cfg.extensions
          )}
      '';

      serviceConfig = {
        KeepAlive = true;
        RunAtLoad = true;
      };
    };
  };
}
