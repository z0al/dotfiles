{ pkgs, ... }:

{
  # https://github.com/Mic92/envfs
  services.envfs = {
    enable = true;

    extraFallbackPathCommands = ''
      ln -s ${pkgs.bash}/bin/bash $out/bash
    '';
  };

  d.shell.variables = {
    ENVFS_RESOLVE_ALWAYS = "1";
  };
}
