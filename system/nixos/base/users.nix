{ user, ... }:

{
  users.users.${user} = {
    isNormalUser = true;
    description = "Ahmed";
    extraGroups = [ "wheel" "video" "audio" ];
  };
}
