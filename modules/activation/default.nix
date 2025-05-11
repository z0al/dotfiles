{ pkgs, lib, ... }:

{
  options.my.activation = with lib; mkOption {
    type = types.attrsOf types.str;
    default = { };
  };

  config = {
    my.activation.reportChanges = ''
      if [ -e "$oldGenPath" ]
      then
        ${pkgs.nvd}/bin/nvd diff "$oldGenPath" "$newGenPath"
      fi
    '';
  };
}
