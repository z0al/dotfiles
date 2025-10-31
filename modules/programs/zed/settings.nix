{ config, ... }:

let
  cfgFonts = config.my.fonts;
in

{
  my.programs.zed.settings = {
    theme = "poimandres";
    ui_font_size = 16;

    buffer_font_family = cfgFonts.mono;
    buffer_font_size = 14.0;

    hard_tabs = true;
    soft_wrap = "bounded";
    show_wrap_guides = false;
    selection_highlight = false;
    cursor_shape = "bar";
    scroll_beyond_last_line = "off";

    indent_guides = {
      enabled = true;
      line_width = 0;
      active_line_width = 1;
      coloring = "fixed";
      background_coloring = "disabled";
    };

    # AI
    show_edit_predictions = true;
    agent.button = false;

    # Toolbar
    tab_bar.show = true;

    title_bar = {
      show_branch_name = true;
      show_sign_in = false;
    };

    project_panel.button = false;
    outline_panel.button = false;
    collaboration_panel.button = false;
    notification_panel.button = false;

    toolbar = {
      breadcrumbs = false;
      quick_actions = false;
      agent_review = false;
      selections_menu = false;
    };

    # Terminal
    terminal = {
      font_size = 12.0;
      button = false;
    };

    auto_update = false;
  };
}
