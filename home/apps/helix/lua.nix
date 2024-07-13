{ pkgs, lib, ... }:

{
  home.packages = with pkgs.latest; [
    stylua
    lua-language-server
  ];

  programs.helix.languages = {
    language = [
      {
        name = "lua";
        indent = {
          tab-width = 2;
          unit = "\t";
        };

        formatter = {
          command = "${pkgs.stylua}/bin/stylua";
          args = lib.flatten [
            [ "-" ]

            # Formating Options:
            [ "--column-width" "80" ]
            [ "--indent-type" "Tabs" ]
            [ "--indent-width" "2" ]
            [ "--sort-requires" ]
          ];
        };
      }
    ];

    language-server.lua-language-server = {
      command = "${pkgs.lua-language-server}/bin/lua-language-server";
    };
  };
}
