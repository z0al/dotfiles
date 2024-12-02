{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.wezterm;

  configFile = /* lua */''
    local wz = require("wezterm")
    local act = wz.action

    return ${lib.generators.toLua { } cfg.settings};
  '';

  format = code:
    let
      safe = lib.escape [ ''"'' ] code;
      stylua = lib.getExe pkgs.stylua;
    in
    pkgs.runCommandLocal
      "format-lua"
      { buildInputs = [ pkgs.stylua ]; }
      ''
        echo "${safe}" | ${stylua} - > $out
      '';
in

{
  imports = [
    ./keybindings.nix
    ./settings.nix
  ];

  options.d.programs.wezterm = with lib;{
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    theme = mkOption {
      type = types.str;
      default = "Catppuccin Mocha";
    };

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = { };
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wezterm
    ];

    my.hm.config = {
      xdg.configFile."wezterm/wezterm.lua".source = format configFile;
    };
  };
}
