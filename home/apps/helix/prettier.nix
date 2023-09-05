{ pkgs, lib, ... }:

let
  pkg = pkgs.nodePackages.prettier;

  prettier = parser: {
    command = "${pkg}/bin/prettier";
    args = [
      "--parser"
      parser
      "--config-precedence"
      "file-override"
      "--use-tabs"
      "--tab-width"
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
