{ config, ... }:

{
  my.osUser = {
    uid = 501;
  };

  users.knownUsers = [
    config.my.osUser.name
  ];
}

