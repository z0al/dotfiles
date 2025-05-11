{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.fnm;

  lts-major = builtins.substring 0 2 pkgs.nodePackages.nodejs.version;

  cliOptions = lib.concatStringsSep " " [
    "--use-on-cd"
    "--corepack-enabled"
    "--version-file-strategy recursive"
    "--log-level quiet"
  ];
in

{
  options.my.programs.fnm = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.typescript.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      fnm
    ];

    environment.shellAliases = {
      nvm = "fnm";
    };

    my.programs.bash.interactiveShellInit = ''
      eval "$(${lib.getExe pkgs.fnm} env --shell bash ${cliOptions})"
    '';

    my.programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.fnm} env --shell fish ${cliOptions} | source
    '';

    hm = {
      home.file.".node-version".text = lts-major;
    };
  };
}
