{ config, pkgs, lib, ... }:

let
  cfg = config.d;

  mkString = default:
    with lib; mkOption {
      inherit default;
      type = types.str;
    };
in

{
  options.d = {
    version = mkString "24.05";

    user = {
      name = mkString "z0al";
      title = mkString cfg.user.name;
    };

    git = {
      user = mkString "z0al";
      email = mkString "z0al@users.noreply.github.com";
    };
  };
}
