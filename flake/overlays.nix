{ inputs, ... }:

let
  config = {
    allowUnfree = true;
  };

  autopy = final: prev: {
    fishPlugins = prev.fishPlugins // {
      autopy = prev.fishPlugins.callPackage (
        {
          buildFishPlugin,
          fetchFromGitHub,
        }:
        buildFishPlugin {
          pname = "autopy";
          version = "0.4.0";
          src = fetchFromGitHub {
            owner = "SpaceShaman";
            repo = "autopy.fish";
            rev = "v0.4.0";
            sha256 = "sha256-CKavIoorBr/7F+q/6NhSb5GQUHwRksddxiDvaamXHhE=";
          };
          meta.homepage = "https://github.com/SpaceShaman/autopy.fish";
        }
      ) { };
    };
  };

  overlays = with inputs; [
    vscode.overlays.default
    autopy
  ];
in

{
  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system config overlays;
      };
    };
}
