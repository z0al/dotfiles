{ config, lib, ... }:

let
  cfg = config.d.run;
in

{
  options.d.run = with lib; mkOption {
    type = types.attrsOf types.str;
    default = { };
  };

  config = {
    my.user = { lib, ... }: {
      home.activation = lib.mapAttrs
        (name: script: lib.hm.dag.entryAfter [ "writeBoundary" ] script)
        cfg;
    };
  };
}
