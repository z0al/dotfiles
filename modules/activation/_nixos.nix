{ config, lib, ... }:

let
  cfg = config.my.activation;
in

{
  system.userActivationScripts = with lib;
    listToAttrs (mapAttrsToList
      (name: script: {
        inherit name;
        value = {
          text = ''
            # Home-manager inspired activation variables
            oldGenPath=/run/current-system
            newGenPath=$(readlink -f "$systemConfig")

            ${script}
          '';
        };
      })
      cfg);
}
