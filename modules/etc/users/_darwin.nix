{ config, lib, ... }:

{
  my.osUser = {
    uid = lib.mkDefault 501;
  };

  users.knownUsers = [
    config.my.osUser.name
  ];
}

