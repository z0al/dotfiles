{ _, ... }:

{
  # Users
  #  use globalPkgs & userPkgs and set home & user dirs and stateVersion
  # hm.users = {
  #   inherit (hmUsers) z0al;
  # };

  users.users.${_.user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ];
  };
}
