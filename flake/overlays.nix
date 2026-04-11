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

  overlays = [
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

      unstable = createChannel inputs.nixpkgs-unstable overlays;

      overrides = (
        final: prev: {
          inherit (unstable)
            # Dev tools
            claude-code
            nodePackages
            openspec
            oxfmt
            zed-editor

            # LSPs
            bash-language-server
            typescript-language-server
            vscode-langservers-extracted
            yaml-language-server

            # Other
            aerospace
            google-chrome
            nerd-fonts
            nixfmt
            ;
        }
      );
    in
    {
      _module.args.pkgs = createChannel inputs.nixpkgs (
        overlays ++ [ overrides ]
      );
    };
}
