{ lib, ... }:

{
  options.d.scripts = with lib; mkOption {
    type = types.attrsOf types.str;
    default = { };
  };
}
