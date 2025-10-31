{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.zed;

  configDir = "${config.my.user.home}/.config/zed";
  toJson = (pkgs.formats.json { }).generate;

  writeJson = path: content: ''
    mkdir -p "$(dirname '${path}')"
    cp ${toJson path content} '${path}'

    chmod 776 '${path}'
    chown ${config.my.user.name} '${path}'
  '';
in

{
  imports = [
    ./extensions.nix
    ./keybindings.nix
    ./settings.nix
  ];

  options.my.programs.zed = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = { };
    };

    keybindings = mkOption {
      type = types.listOf types.attrs;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    my.activation.configureZed = ''
      ${writeJson "${configDir}/settings.json" cfg.settings}
      ${writeJson "${configDir}/keymap.json" cfg.keybindings}
    '';
  };
}
