{
  hm.users = {
    inherit (hmUsers) z0al;
  };

  users.users.z0al = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" "networkmanager" ];
  };
}

