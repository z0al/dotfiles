{ config, lib, ... }:

let
  cfg = config.d.scripts;
in

{
  system.userActivationScripts = with lib;
    listToAttrs (attrValues (mapAttrs
      (name: script: {
        inherit name;
        value = { text = script; };
      })
      cfg));
}
