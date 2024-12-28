{ config, lib, ... }:

let
  cfg = config.d.scripts;
in

{
  system.userActivationScripts = with lib;
    listToAttrs (mapAttrsToList
      (name: script: {
        inherit name;
        value = { text = script; };
      })
      cfg);
}
