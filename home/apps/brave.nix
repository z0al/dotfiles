{ config, pkgs, lib, ... }:

with lib;

let
  exts = [
    "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1Password
    "nkgllhigpcljnhoakjkgaieabnkmgdkb" # Don't F*** With Paste
    "aapbdbdomjkkjkaonfhkkikfgjllcleb" # Google Translate
    "kbfnbcaeplbcioakkpcpgfkobkghlhen" # Grammarly
    "bcjindcccaagfpapjjmafapmmgkkhgoa" # JSON Formatter
    "mapjgeachilmcbbokkgcbgpbakaaeehi" # Omni
    "fmkadmapgofadopljbjfkapdkoienihi" # React Developer Tools
    "dgjhfomjieaadpoljlnidmbgkdffpack" # Sourcegraph
  ];

  cfg = config.d.apps.brave;
in

{
  options.d.apps.brave = {
    enable = mkOption {
      type = types.bool;
      default = pkgs.stdenv.isLinux;
    };
  };

  config = {
    programs.chromium = {
      enable = cfg.enable;
      package = pkgs.brave;

      extensions = map (e: { id = e; }) exts;
    };
  };
}
