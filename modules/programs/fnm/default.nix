{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.fnm;

  lts-major = builtins.substring 0 2 pkgs.nodePackages.nodejs.version;
in

{
  options.d.programs.fnm = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.typescript.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      fnm
    ];

    environment.shellAliases = {
      nvm = "fnm";
    };

    d.programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.fnm} env --use-on-cd --corepack-enabled --version-file-strategy recursive --log-level quiet | source
    '';

    my.user = {
      home.file.".node-version".text = lts-major;
    };
  };
}
