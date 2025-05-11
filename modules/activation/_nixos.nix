{ config, lib, ... }:

let
  cfg = config.my.activation;
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
