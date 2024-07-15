{ pkgs, lib, ... }:

{
  options.d.programs.homebrew = with lib; {
    enable = mkOption {
      type = types.bool;
      default = pkgs.stdenv.isDarwin;
    };

    brews = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };

    casks = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };

    taps = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };
  };
}
