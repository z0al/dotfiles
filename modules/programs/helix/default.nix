{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.helix;

  toml = pkgs.formats.toml { };
  toTOML = toml.generate;
in

{
  imports = [
    ./support
    ./settings.nix
  ];

  options.d.programs.helix = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    theme = mkOption {
      type = types.str;
    };

    settings = mkOption {
      type = toml.type;
      default = { };
    };

    languages = mkOption {
      type = toml.type;

      default = { };
    };

    packages = mkOption {
      type = types.listOf types.package;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = cfg.packages ++ [
      pkgs.helix
    ];

    environment.variables = {
      EDITOR = "hx";
    };

    hm.xdg.configFile = {
      "helix/config.toml".source = toTOML "hx-conf.toml" cfg.settings;
      "helix/languages.toml".source = toTOML "hx-langs.toml" cfg.languages;
    };
  };
}
