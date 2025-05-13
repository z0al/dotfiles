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
          vscode

          # LSPs
          bash-language-server
          typescript-language-server
          vscode-langservers-extracted
          yaml-language-server

          # Other
          google-chrome
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
