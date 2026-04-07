{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.node;

  cliOptions = lib.concatStringsSep " " [
    "--use-on-cd"
    "--version-file-strategy recursive"
    "--log-level quiet"
  ];
in

{
  options.my.programs.node = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.my.presets.typescript.enable;
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      fnm
      nodePackages.npm
      nodePackages.yarn
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
  };
}
