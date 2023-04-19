{ pkgs, ... }:

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
in

{
  programs.chromium = {
    enable = true;
    package = pkgs.brave;

    extensions = map (e: { id = e; }) exts;
  };
}
