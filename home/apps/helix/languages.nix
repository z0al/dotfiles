{ pkgs, lib, ... }:

let
  prettier = parser:
    {
      command = "prettier";
      args = [
        "--parser"
        parser
        "--config-precedence"
        "file-override"
        "--use-tabs"
      ];
    };

  languages = [
    {
      names = [ "html" ];
      formatter = prettier "html";
    }

    {
      names = [ "css" ];
      formatter = prettier "css";
    }

    {
      names = [ "javascript" "jsx" "typescript" "tsx" ];
      formatter = prettier "typescript";
    }

    {
      names = [ "json" ];
      formatter = prettier "json";
    }

    {
      names = [ "yaml" ];
      formatter = prettier "yaml";
    }

    {
      names = [ "markdown" "markdown.inline" ];
      formatter = prettier "markdown";
    }

    {
      names = [ "graphql" ];
      formatter = prettier "graphql";
    }
  ];

  generate = configs: lib.flatten (map
    (cfg: map
      (name:
        { inherit name; } //
        builtins.removeAttrs cfg [ "names" ]
      )
      cfg.names
    )
    configs);
in

{
  programs.helix.languages = generate languages;
}
