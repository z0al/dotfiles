{ inputs, hostName, ... }:

{
  imports = [
    ./config
  ];

  networking = { inherit hostName; };

  home-manager.sharedModules = [
    ./home.nix
    inputs.nix-index.homeModules.nix-index
  ];
}
