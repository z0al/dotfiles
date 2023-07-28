{ pkgs, ... }:

{
  # https://github.com/Mic92/envfs
  services.envfs = {
    enable = true;

    extraFallbackPathCommands = ''
      ln -s ${pkgs.bash}/bin/bash $out/bash
    '';
  };

  environment.variables = {
    ENVFS_RESOLVE_ALWAYS = "1";
  };
}
