{ lib, ... }:

{
  options.my.activation = with lib; mkOption {
    type = types.attrsOf types.str;
    default = { };
  };
}
