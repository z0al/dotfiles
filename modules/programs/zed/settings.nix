{ config, ... }:

let
  cfgFonts = config.my.fonts;
in

{
  my.programs.zed.settings = {
    theme = "poimandres";
    icon_theme = "Warm Charmed Icons";

    theme_overrides = {
      "poimandres" = {
        "border" = "#0000";
        "border.variant" = "#0000";
        "syntax" = {
          "boolean"."color" = "#d0679d";
          "constant.builtin"."color" = "#d0679d";
        };
      };
    };

    # Font
    ui_font_size = 16;
    ui_font_family = cfgFonts.mono;
    buffer_font_family = cfgFonts.mono;
    buffer_font_size = 14.0;
    terminal.font_size = 14.0;

    # Window
    title_bar = {
      show_project_items = true;
      show_branch_name = true;
      show_sign_in = false;
      show_user_menu = false;
      show_onboarding_banner = false;
    };

    # Editor
    tab_bar.show = false;
    toolbar = {
      breadcrumbs = true;
      quick_actions = false;
      selections_menu = false;
    };

    hard_tabs = true;
    soft_wrap = "bounded";
    show_wrap_guides = false;
    selection_highlight = false;
    cursor_shape = "bar";

    indent_guides.enabled = false;
    gutter = {
      min_line_number_digits = 0;
      runnables = false;
      folds = false;
    };

    drag_and_drop_selection.enabled = false;
    inline_code_actions = false;

    diff_view_style = "unified";

    # Scrollbar
    scrollbar.show = "never";
    scroll_beyond_last_line = "off";

    # Explorer
    project_panel = {
      starts_open = false;
      hide_root = true;
      indent_guides.show = "never";
      auto_reveal_entries = true;
    };

    outline_panel = {
      indent_guides.show = "never";
    };

    # Status bar
    status_bar = {
      active_encoding_button = "enabled";
      line_endings_button = true;
    };
    project_panel.button = false;
    search.button = false;
    terminal.button = false;
    outline_panel.button = false;
    collaboration_panel.button = false;
    notification_panel.button = false;
    diagnostics.button = false;
    git_panel.button = false;
    debugger.button = false;

    # Other
    disable_ai = true;
    auto_update = false;
  };
}
