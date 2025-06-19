{ config, pkgs, lib, ... }:

let
  cfg = config.my.programs.vscode;

  toJson = (pkgs.formats.json { }).generate;

  userName = config.my.user.name;
  userHome = config.my.user.home;

  cfgDir =
    if pkgs.stdenv.isDarwin
    then "${userHome}/Library/Application Support/Code/User"
    else "${userHome}/.config/Code/User";

  extDir = "${userHome}/.vscode/extensions";

  writeJson = path: content: ''
    mkdir -p "$(dirname '${path}')"
    cp ${toJson path content} '${path}'
  '';

  # https://discourse.nixos.org/t/vscode-extensions-setup/1801/2
  installExt = ext: ''
    mkdir -p '${extDir}'
    ln -sf ${ext}/share/vscode/extensions/* '${extDir}/'
  '';
in

{
  imports = [
    ./extensions.nix
    ./keybindings.nix
    ./settings.nix
  ];

  options.my.programs.vscode = with lib; {
    enable = mkOption {
      type = types.bool;
      default = true;
    };

    theme = mkOption {
      type = types.str;
    };

    settings = mkOption {
      type = types.attrsOf types.anything;
      default = { };
    };

    keybindings = mkOption {
      type = types.listOf types.attrs;
      default = [ ];
    };

    extensions = mkOption {
      type = types.listOf types.package;
      default = [ ];
    };

    packages = mkOption {
      type = types.listOf types.package;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = cfg.packages ++ [ pkgs.vscode ];

    my.activation.configureVscode = ''
      ${writeJson "${cfgDir}/settings.json" cfg.settings}
      ${writeJson "${cfgDir}/keybindings.json" cfg.keybindings}

      # Extensions
      rm -rf '${extDir}'
      mkdir -p '${extDir}'
      chown -R '${userName}' '${extDir}'

      ${lib.concatLines (map installExt cfg.extensions)}
      ${writeJson
        "${extDir}/extensions.json"
        (map pkgs.vscode-utils.toExtensionJsonEntry cfg.extensions)}

      ${lib.getExe pkgs.vscode} --list-extensions > /dev/null
    '';
  };
}
