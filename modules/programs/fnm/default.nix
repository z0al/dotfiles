{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.fnm;

  lts-major = builtins.substring 0 2 pkgs.nodePackages.nodejs.version;
in

{
  options.d.programs.fnm = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.nodejs.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      fnm
    ];

    d.shell.aliases = {
      nvm = "fnm";
    };

    d.programs.fish.init = ''
      ${lib.getExe pkgs.fnm} env --use-on-cd --corepack-enabled --version-file-strategy recursive --log-level quiet | source
    '';

    my.user = {
      home.file.".node-version".text = lts-major;
    };
  };
}
