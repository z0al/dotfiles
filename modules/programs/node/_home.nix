{
  config,
  lib,
  osConfig,
  pkgs,
  ...
}:

let
  cfg = config.programs.node;

  cliOptions = lib.concatStringsSep " " [
    "--use-on-cd"
    "--version-file-strategy recursive"
    "--log-level quiet"
  ];
in

{
  options.programs.node.enable = lib.mkOption {
    type = lib.types.bool;
    default = osConfig.my.presets.typescript.enable;
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      fnm
      nodejs
      yarn
    ];

    programs.bash.initExtra = ''
      eval "$(${lib.getExe pkgs.fnm} env --shell bash ${cliOptions})"
    '';

    programs.fish.interactiveShellInit = ''
      ${lib.getExe pkgs.fnm} env --shell fish ${cliOptions} | source
    '';
  };
}
