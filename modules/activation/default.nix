{ lib, ... }:

{
  options.d.activation = with lib; mkOption {
    type = types.attrsOf types.str;
    default = { };
  };
}
