{ config, lib, ... }:

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
    version = mkString "24.11";

    user = {
      name = mkString "z0al";
      title = mkString cfg.user.name;
      ssh.key = mkString "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICINRjw8qGiYwNcKWWwiqcO1fV1ZbCfrvKBI+i/xjJ0e";
    };

    git = {
      user = mkString "z0al";
      email = mkString "z0al@users.noreply.github.com";
    };
  };
}
