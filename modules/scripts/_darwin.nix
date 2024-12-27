{ config, lib, ... }:

let
  scripts = config.d.scripts;
in

{
  system.activationScripts.postActivation.text = lib.concatLines (
    lib.attrValues (
      lib.mapAttrs
        (name: script: ''
          echo "Activating ${name}"
          ${script}
        '')
        scripts
    ));
}
