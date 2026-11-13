{ lib, ... }:

{
  options.programs.claude = with lib; {
    enable = mkOption {
      type = types.bool;
      default = false;
    };
  };
}
