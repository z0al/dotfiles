{ theme, ... }:

let
  themeMapping = {
    catppuccin = "catppuccin_mocha";
  };
in

{
  programs.helix.settings = {
    theme = themeMapping.${theme};

    editor = {
      line-number = "relative";
      cursorline = true;
      color-modes = true;

      cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      indent-guides.render = true;
    };
  };
}
