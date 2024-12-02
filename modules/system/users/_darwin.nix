{ config, lib, ... }:

{
  my.user = {
    uid = lib.mkDefault 501;
  };

  users.knownUsers = [
    config.my.user.name
  ];
}

