{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.brave;

  profileFile = pkgs.writeText "brave-browser.plist" (
    lib.generators.toPlist { } cfg.profile
  );

  targetFile = lib.escapeShellArg
    "/Library/Managed Preferences/com.brave.Browser.plist";

  cmd =
    if cfg.enable == true then
      ''
        cp ${profileFile} ${targetFile}
        chmod 644 ${targetFile}
      ''
    else
      "rm -f ${targetFile}";
in

{
  config = {
    system.activationScripts.postActivation.text = ''
      echo "Activating setupBraveBrowser"
      ${cmd}
    '';
  };
}
