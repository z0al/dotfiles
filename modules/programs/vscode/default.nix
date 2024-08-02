{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.vscode;
  userHome = config.my.osUser.home;

  cfgPath =
    if pkgs.stdenv.isDarwin
    then "${userHome}/Library/Application Support/Code"
    else "${userHome}/.config/Code";

  extPath = "${userHome}/.vscode/extensions";

  pkg = pkgs.unstable.vscode;

  settings = builtins.toJSON cfg.settings;
  keybindings = builtins.toJSON cfg.keybindings;
  extensions = pkgs.vscode-utils.toExtensionJson cfg.extensions;
in

{
  imports = [
    ./support
    ./keybindings.nix
    ./settings.nix
  ];

  options.d.programs.vscode = with lib; {
    enable = mkOption {
      type = types.bool;
      default = config.d.profiles.dev.enable;
    };

    settings = mkOption {
      type = types.attrs;
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
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkg ];

    my.user = { lib, ... }: {
      home.activation = {
        configure-vscode = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
          # Settings
          mkdir -p '${cfgPath}/User'
          echo '${settings}' > '${cfgPath}/User/settings.json'

          # Keybindings
          echo '${keybindings}' > '${cfgPath}/User/keybindings.json'

          # Extensions
          if [ -d '${extPath}' ]; then
            rm -rf '${extPath}'
          fi
          mkdir -p '${extPath}'
          ${lib.concatStringsSep "\n" (map (ext: ''
            ln -sf ${ext}/share/vscode/extensions/* '${extPath}/'
          '') cfg.extensions)}
          echo '${extensions}' > '${extPath}/extensions.json'
          ${lib.getExe pkg} --list-extensions > /dev/null
        '';
      };
    };
  };
}
