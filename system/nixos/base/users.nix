{ user, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ];
  };
}
