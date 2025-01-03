{ config, ... }:

let
  passDir = "/nix/data/passwords";
in

{
  my.user = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    passwordFile = "${passDir}/${config.my.user.name}";
  };

  # Don't allow mutation of users outside of the config. When using
  # tmpfs as root (/) we must declare all users & passwords within
  # the configuration.
  users.mutableUsers = false;

  # Note: Content of $passDir/* have been generated with
  # the command: mkpasswd -m SHA-512 -s
  users.users.root.passwordFile = "${passDir}/root";
}

