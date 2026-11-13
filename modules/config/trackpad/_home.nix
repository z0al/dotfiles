{ lib, pkgs, ... }:

{
  config = lib.mkIf pkgs.stdenv.hostPlatform.isDarwin {
    targets.darwin.currentHostDefaults.NSGlobalDomain = {
      "com.apple.mouse.tapBehavior" = 1;
    };
  };
}
