{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.vscode;
  pkg = pkgs.unstable.vscode;

  userHome = config.my.user.home;

  cfgDir =
    if pkgs.stdenv.isDarwin
    then "${userHome}/Library/Application Support/Code/User"
    else "${userHome}/.config/Code/User";

  extDir = "${userHome}/.vscode/extensions";

  write = path: content: ''
    run mkdir -p $(dirname "${path}")
    run echo '${content}' > "${path}"
  '';

  # https://discourse.nixos.org/t/vscode-extensions-setup/1801/2
  installExt = ext: ''
    run mkdir -p "${extDir}"
    run ln -sf ${ext}/share/vscode/extensions/* "${extDir}/"
  '';
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
      default = true;
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

    packages = mkOption {
      type = types.listOf types.package;
      default = [ ];
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = cfg.packages ++ [ pkg ];

    d.run.configureVsCode = ''
      ${write "${cfgDir}/settings.json" (builtins.toJSON cfg.settings)}
      ${write "${cfgDir}/keybindings.json" (builtins.toJSON cfg.keybindings)}

      # Extensions
      if [ -d "${extDir}" ]; then
        run rm -rf "${extDir}"
      fi

      ${lib.concatLines (map installExt cfg.extensions)}
      ${write
        "${extDir}/extensions.json"
        (pkgs.vscode-utils.toExtensionJson cfg.extensions)}

      run --quiet ${lib.getExe pkg} --list-extensions
    '';
  };
}
