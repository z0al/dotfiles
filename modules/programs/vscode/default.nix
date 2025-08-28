{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.my.programs.vscode;

  vscodePackage = pkgs.code-cursor;

  userHome = config.my.user.home;

  configDirName =
    {
      "vscode" = "Code";
      "cursor" = "Cursor";
    }
    .${vscodePackage.pname};

  configDir =
    if pkgs.stdenv.isDarwin then
      "${userHome}/Library/Application Support/${configDirName}/User"
    else
      "${userHome}/.config/${configDirName}/User";

  toJson = (pkgs.formats.json { }).generate;
  writeJson = path: content: ''
    mkdir -p "$(dirname '${path}')"
    cp ${toJson path content} '${path}'
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
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      vscodePackage
      nixd
    ];

    environment.shellAliases = lib.mkIf (vscodePackage.pname == "cursor") {
      code = "cursor";
    };

    hm.programs.vscode = {
      enable = true;
      package = vscodePackage;
      mutableExtensionsDir = true;
      profiles.default = {
        inherit (cfg) extensions;
      };
    };

    my.activation.configureVscode = ''
      ${writeJson "${configDir}/settings.json" cfg.settings}
      ${writeJson "${configDir}/keybindings.json" cfg.keybindings}
    '';
  };
}
