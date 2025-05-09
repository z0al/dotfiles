{
  description = "My NixOS ❄ / MacOS 🍏 Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-24.11";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    hm.url = "github:nix-community/home-manager/release-24.11";
    hm.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";

    hardware.url = "github:NixOS/nixos-hardware/master";

    persistence.url = "github:nix-community/impermanence";

    nix-index.url = "github:Mic92/nix-index-database";
    nix-index.inputs.nixpkgs.follows = "nixpkgs";

    vscode.url = "github:nix-community/nix-vscode-extensions";
    vscode.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    plist-manager.url = "github:z0al/plist-manager";
    plist-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { hm
    , persistence
    , flake-parts
    , nix-index
    , nix-homebrew
    , plist-manager
    , ...
    } @ inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./flake/hosts.nix
        ./flake/overlays.nix
      ];

      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      flake = {
        nixosModules.default.imports = [
          hm.nixosModules.home-manager
          persistence.nixosModule.impermanence
          nix-index.nixosModules.nix-index
          ./modules/nixos.nix
        ];

        darwinModules.default.imports = [
          hm.darwinModules.home-manager
          nix-homebrew.darwinModules.nix-homebrew
          nix-index.darwinModules.nix-index
          plist-manager.darwinModules.default
          ./modules/darwin.nix
          # Legacy
          ./system/darwin
        ];
      };
    };

  nixConfig = {
    extra-trusted-substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
      "https://helix.cachix.org"
    ];

    extra-trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
}
