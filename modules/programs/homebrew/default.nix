{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.homebrew;

  brewPrefix = if pkgs.stdenv.isDarwin then "/opt/homebrew" else "/usr/local";
in

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

  config = lib.mkIf cfg.enable {
    my.user.programs = {
      fish.interactiveShellInit = ''
        # d.programs.homebrew
        if test -e ${brewPrefix}/bin/brew;
          eval "$(${brewPrefix}/bin/brew shellenv)"
        end
      '';
    };
  };
}
