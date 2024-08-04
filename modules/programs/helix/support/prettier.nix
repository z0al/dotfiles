{ config, pkgs, lib, ... }:

let
  cfg = config.d.programs.helix;

  prettier = parser: {
    command = lib.getExe pkgs.unstable.nodePackages.prettier;
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

  languages = [
    "css"
    "graphql"
    "html"
    "javascript"
    "json"
    "jsx"
    "markdown"
    "tsx"
    "typescript"
    "yaml"
  ];

  format = lang: {
    name = lang;
    formatter =
      if lib.elem lang [ "jsx" "tsx" "javascript" ]
      then prettier "typescript" else prettier lang;
  };
in

{
  config.d.programs.helix = lib.mkIf cfg.enable {
    languages.language = map format languages;
  };
}
