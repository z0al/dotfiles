{ config, lib, ... }:

let
  cfg = config.d.activation;
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
