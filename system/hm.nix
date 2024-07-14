{ inputs, lib, version, user, theme, ... }:

with lib;

{
  imports = [
    (mkAliasOptionModule [ "myUser" ] [ "home-manager" "users" user ])
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = {
      inherit version user theme;
    };
  };

  myUser.imports = [
    inputs.nix-index.hmModules.nix-index
    ../home
  ];
}
