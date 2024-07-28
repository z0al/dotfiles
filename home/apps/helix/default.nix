{ config, pkgs, lib, theme, ... }:

with lib;

let
  cfg = config.d.apps.helix;

  themeMapping = {
    catppuccin = "catppuccin_mocha";
  };

  settings = {
    theme = themeMapping.${theme};

    editor = {
      auto-format = true;
      bufferline = "never";
      color-modes = true;
      cursorline = true;
      indent-guides.render = true;
      line-number = "absolute";
      soft-wrap.enable = true;

      # FIXME: remove once https://github.com/helix-editor/helix/issues/1475 is fixed
      # auto-info = false;

      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      statusline = {
        mode.normal = "";
        mode.insert = "";
        mode.select = "";

        left = [ "mode" "spacer" "spinner" "file-name" ];
        right = [
          "diagnostics"
          "position"
          "primary-selection-length"
          "file-encoding"
          "file-type"
          "version-control"
          "spacer"
          "position-percentage"
        ];
      };
    };
  };
in

{
  imports = [
    ./lua.nix
    ./nix.nix
    ./prettier.nix
    ./prisma.nix
    ./typescript.nix
  ];

  options.d.apps.helix = {
    enable = mkOption {
      type = types.bool;
      default = true;
    };
  };

  config = mkIf cfg.enable {
    programs.helix = {
      enable = true;
      package = pkgs.helix;
      settings = settings;
    };

    home.sessionVariables = {
      EDITOR = "hx";
    };

    home.shellAliases = {
      vim = "hx";
    };

    # hx --health
    # Languages servers & tools
    home.packages =
      (with pkgs.nodePackages; [
        bash-language-server
        yaml-language-server
      ]) ++

      (with pkgs; [
        delve
        gopls
        lldb
        marksman
        nil
        python311Packages.python-lsp-server
        taplo
        terraform-ls
      ]);
  };
}
