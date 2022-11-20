let
  formatter = {
    "editor.defaultFormatter" = "esbenp.prettier-vscode";
  };
in
{
  programs.vscode.userSettings = {
    "prettier.enable" = true;
    "prettier.semi" = true;
    "prettier.useTabs" = true;

    # Use for supported languages
    "[css]" = formatter;
    "[scss]" = formatter;
    "[html]" = formatter;
    "[json]" = formatter;
    "[jsonc]" = formatter;
    "[markdown]" = formatter;
    "[javascript]" = formatter;
    "[typescript]" = formatter;
    "[javascriptreact]" = formatter;
    "[typescriptreact]" = formatter;
  };
}
