{ config, lib, ... }:

let
  cfg = config.my.activation;
in

{
  system.activationScripts.postActivation.text =
    with lib;
    concatLines (
      mapAttrsToList (name: script: ''
        echo "Activating ${name}"

        # Home-manager inspired activation variables
        oldGenPath=/run/current-system
        newGenPath=$(readlink -f "$systemConfig")

        ${script}
      '') cfg
    );
}
