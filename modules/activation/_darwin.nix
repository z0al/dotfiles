{ config, lib, ... }:

let
  cfg = config.my.activation;
in

{
  system.activationScripts.postActivation.text = with lib;
    concatLines (mapAttrsToList
      (name: script: ''
        echo "Activating ${name}"
        ${script}
      '')
      cfg
    );
}
