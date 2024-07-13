{ pkgs, lib, ... }:

let
  pkg = pkgs.latest.nodePackages.prettier;

  prettier = parser: {
    command = "${pkg}/bin/prettier";
    args = lib.flatten [
      [ "--parser" parser ]

      # Prefer project-specific config file over the options defined below.
      [ "--config-precedence" "prefer-file" ]

      # Formating Options:
      [ "--use-tabs" ]
      [ "--tab-width" "2" ]
      [ "--print-width" "80" ]
      [ "--quote-prop" "consistent" ]
      [ "--prose-wrap" "always" ]
    ];
  };
in

{
  home.packages = [ pkg ];

  programs.helix.languages.language = [
    { name = "html"; formatter = prettier "html"; }
    { name = "css"; formatter = prettier "css"; }

    { name = "jsx"; formatter = prettier "typescript"; }
    { name = "tsx"; formatter = prettier "typescript"; }
    { name = "javascript"; formatter = prettier "typescript"; }
    { name = "typescript"; formatter = prettier "typescript"; }

    { name = "json"; formatter = prettier "json"; }
    { name = "yaml"; formatter = prettier "yaml"; }

    { name = "markdown"; formatter = prettier "markdown"; }

    { name = "graphql"; formatter = prettier "graphql"; }
  ];
}
