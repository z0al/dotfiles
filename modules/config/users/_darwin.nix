{ config, lib, ... }:

{
  my.user = {
    uid = lib.mkDefault 501;
  };

  users.knownUsers = [
    config.my.user.name
  ];

  ids.gids.nixbld = 30000;
}
