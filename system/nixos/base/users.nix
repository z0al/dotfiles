{ _, ... }:

{
  users.users.${_.user} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "audio" ];
  };
}
