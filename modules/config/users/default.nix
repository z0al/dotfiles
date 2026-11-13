{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.my;

  mkAlias =
    from: to:
    { config, options, ... }:
    {
      options = lib.setAttrByPath from (
        lib.mkOption {
          description = "Alias of the primary user's option.";
          apply = _: lib.getAttrFromPath (to config.my.username) config;
        }
      );

      config = lib.setAttrByPath (to config.my.username) (
        lib.mkAliasDefinitions (lib.getAttrFromPath from options)
      );
    };

  home =
    path: user:
    [
      "home-manager"
      "users"
      user
    ]
    ++ path;

  homeFolder =
    if pkgs.stdenv.hostPlatform.isDarwin then
      "/Users/${cfg.username}"
    else
      "/home/${cfg.username}";
in

{
  imports = [
    (mkAlias [ "my" "user" ] (user: [
      "users"
      "users"
      user
    ]))
    (mkAlias [ "my" "programs" ] (home [ "programs" ]))
    (mkAlias [ "my" "services" ] (home [ "services" ]))
    (mkAlias [ "my" "profiles" ] (home [ "profiles" ]))
    (mkAlias [ "my" "deviceManager" ] (home [ "deviceManager" ]))
  ];

  options.my.username = lib.mkOption {
    type = lib.types.str;
    default = "z0al";
  };

  config = {
    my.user = {
      name = cfg.username;
      description = cfg.username;
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
