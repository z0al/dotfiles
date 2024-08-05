{
  description = "My NixOS ❄ / MacOS 🍏 Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    hm.url = "github:nix-community/home-manager/release-24.05";
    hm.inputs.nixpkgs.follows = "nixpkgs";

    hardware.url = "github:NixOS/nixos-hardware/master";

    persistence.url = "github:nix-community/impermanence";

    nix-index.url = "github:Mic92/nix-index-database";
    nix-index.inputs.nixpkgs.follows = "nixpkgs";

    vscode.url = "github:nix-community/nix-vscode-extensions";
    vscode.inputs.nixpkgs.follows = "nixpkgs";

    parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { nixpkgs
    , hm
    , persistence
    , parts
    , nix-index
    , ...
    } @ inputs:
    parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./flake/hosts.nix
        ./flake/overlays.nix
        ./flake/pkgs.nix
      ];

      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      flake = {
        nixosModules.default.imports = [
          nixpkgs.nixosModules.readOnlyPkgs
          hm.nixosModules.home-manager
          persistence.nixosModule.impermanence
          nix-index.nixosModules.nix-index
          ./modules/_nixos.nix
          # Legacy
          ./system/nixos
        ];

        darwinModules.default.imports = [
          hm.darwinModules.home-manager
          nix-index.darwinModules.nix-index
          ./modules/_darwin.nix
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
      "helix.cachix.org-1:ejp9KQpR1FBI2onstMQ34yogDm4OgU2ru6lIwPvuCVs="
    ];
  };
}
