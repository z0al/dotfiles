{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.fnm;

  lts-major = builtins.substring 0 2 pkgs.nodePackages.nodejs.version;

  cliOptions = lib.concatStringsSep " " [
    "--use-on-cd"
    "--corepack-enabled"
    "--version-file-strategy recursive"
    "--log-level quiet"
  ];
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

    d.programs.bash.interactiveShellInit = ''
      eval "$(${lib.getExe pkgs.fnm} env --shell bash ${cliOptions})"
    '';

    d.programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.fnm} env --shell fish ${cliOptions} | source
    '';

    my.user = {
      home.file.".node-version".text = lts-major;
    };
  };
}
