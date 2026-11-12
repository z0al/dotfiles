{ lib, ... }:

{
  options.programs.kubectx.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
  };
}
