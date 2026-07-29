{ pkgs, lib, ... }:

let
  username = "z0al";

  homeFolder =
    if pkgs.stdenv.isDarwin then
      "/Users/${username}"
    else
      "/home/${username}";
in

{
  imports = with lib; [
    (mkAliasOptionModule [ "my" "user" ] [ "users" "users" username ])

    (mkAliasOptionModule
      [ "my" "programs" ]
      [ "home-manager" "users" username "programs" ]
    )

    (mkAliasOptionModule
      [ "my" "presets" ]
      [ "home-manager" "users" username "presets" ]
    )

    (mkAliasOptionModule
      [ "my" "deviceManager" ]
      [ "home-manager" "users" username "deviceManager" ]
    )
  ];

  config = {
    my.user = {
      name = username;
      description = username;
      home = homeFolder;
      shell = pkgs.fish;
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
    };
  };
}
