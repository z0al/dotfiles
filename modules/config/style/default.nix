{ lib, ... }:

{
  options.my.style = with lib; {
    dark = mkOption {
      type = types.bool;
      default = true;
      description = "Use dark theme";
    };
  };
}
