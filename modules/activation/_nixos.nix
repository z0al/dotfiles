{ config, lib, ... }:

let
  cfg = config.d.activation;
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
