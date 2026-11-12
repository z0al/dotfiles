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
    let
      createChannel =
        src: overlays:
        import src {
          inherit system config overlays;
        };

      stable = createChannel inputs.nixpkgs-stable overlays;

      overrides = final: prev: {
        inherit (stable) fnm;
      };
    in
    {
      _module.args.pkgs = createChannel inputs.nixpkgs (
        overlays ++ [ overrides ]
      );
    };
}
