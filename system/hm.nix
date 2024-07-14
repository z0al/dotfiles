{ config, inputs, lib, theme, ... }:

with lib;

{
  imports = [
    (mkAliasOptionModule [ "myUser" ] [ "home-manager" "users" config.d.user.name ])
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit theme;
    };
  };

  myUser.imports = [
    inputs.nix-index.hmModules.nix-index
    ../home
  ];
}
