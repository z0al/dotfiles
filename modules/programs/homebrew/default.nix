{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.homebrew;
  brew =
    if pkgs.stdenv.isDarwin then "/opt/homebrew/bin/brew"
    else "/usr/local/bin/bew";
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
    environment.interactiveShellInit = ''
      if [ -f ${brew} ]; then
        eval "$(${brew} shellenv)"
      fi
    '';
  };
}
