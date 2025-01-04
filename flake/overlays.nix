{ inputs, ... }:

let
  config = {
    allowUnfree = true;
  };

  overlays = with inputs; [
    vscode.overlays.default
  ];
in

{
  perSystem = { system, ... }:
    let
      createChannel = src: overlays: import src {
        inherit system config overlays;
      };

      unstable = createChannel inputs.nixpkgs-unstable overlays;

      overrides = (final: prev: {
        inherit (unstable)
          # Dev tools
          colima
          helix
          nil
          nixd
          nodePackages
          rust-analyzer
          typescript-language-server
          vscode
          vscode-langservers-extracted

          # Other
          nerd-fonts
          ;
      });
    in
    {
      _module.args.pkgs = createChannel inputs.nixpkgs (
        overlays ++ [ overrides ]
      );
    };
}
