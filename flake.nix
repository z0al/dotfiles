{
  description = "My NixOS ❄ / MacOS 🍏 Configuration";

  inputs = {
    stable.url = "github:nixos/nixpkgs/nixos-24.05";
    latest.url = "github:nixos/nixpkgs/nixos-unstable";

    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "stable";

    hm.url = "github:nix-community/home-manager/release-24.05";
    hm.inputs.nixpkgs.follows = "stable";

    hardware.url = "github:NixOS/nixos-hardware/master";

    persistence.url = "github:nix-community/impermanence";

    nix-index.url = "github:Mic92/nix-index-database";
    nix-index.inputs.nixpkgs.follows = "stable";

    vscode.url = "github:nix-community/nix-vscode-extensions";
    vscode.inputs.nixpkgs.follows = "stable";

    fenix.url = "github:nix-community/fenix";
    fenix.inputs.nixpkgs.follows = "stable";

    parts.url = "github:hercules-ci/flake-parts";

    # helix.url = "github:helix-editor/helix";
    # helix.inputs.nixpkgs.follows = "stable";
  };

  outputs =
    { stable
    , hm
    , persistence
    , parts
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
          stable.nixosModules.readOnlyPkgs
          hm.nixosModules.home-manager
          persistence.nixosModule.impermanence
          ./modules/_nixos.nix
          # Legacy
          ./system/nixos
        ];

        darwinModules.default.imports = [
          hm.darwinModules.home-manager
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
