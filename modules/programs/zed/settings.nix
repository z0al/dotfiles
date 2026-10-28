{ config, ... }:

let
  cfgFonts = config.fonts;
in

{
  programs.zed-editor.userSettings = {
    theme = "poimandres";
    icon_theme = "Soft Charmed Icons";

    ui_font_family = cfgFonts.mono;
    ui_font_size = 14;
    buffer_font_family = cfgFonts.mono;
    buffer_font_size = 13;

    # Editor
    vim_mode = true;
    tab_size = 2;
    soft_wrap = "bounded";
    show_wrap_guides = false;
    format_on_save = "on";
    selection_highlight = false;
    mouse_wheel_zoom = false;
    drag_and_drop_selection.enabled = false;
    indent_guides.enabled = false;
    scrollbar.selected_symbol = false;
    scroll_beyond_last_line = "vertical_scroll_margin";
    vertical_scroll_margin = 5;
    diff_view_style = "unified";
    git.inline_blame.enabled = false;
    inline_code_actions = false;

    gutter = {
      folds = false;
      runnables = false;
      breakpoints = false;
      bookmarks = false;
    };

    # Tabs
    when_closing_with_no_tabs = "keep_window_open";
    tab_switcher.show_file_preview = false;

    tab_bar = {
      show = false;
      show_nav_history_buttons = false;
      show_tab_bar_buttons = false;
      show_pinned_tabs_in_separate_row = false;
    };

    # Window
    title_bar = {
      show_menus = false;
      show_user_menu = false;
      show_sign_in = false;
      show_worktree_name = false;
      show_project_items = false;
      show_branch_name = false;
      show_branch_status_icon = false;
      show_onboarding_banner = false;
      show_user_picture = false;
    };

    toolbar = {
      breadcrumbs = true;
      quick_actions = false;
      selections_menu = false;
      agent_review = false;
      code_actions = false;
    };

    status_bar = {
      active_language_button = false;
      cursor_position_button = false;
      show_active_file = false;
    };

    # Panels
    project_panel = {
      button = false;
      dock = "left";
      indent_guides.show = "never";
    };

    git_panel = {
      button = false;
      dock = "left";
      commit_title_max_length = 50;
    };

    outline_panel.button = false;
    collaboration_panel.button = false;
    debugger.button = false;
    terminal.button = false;
    search.button = false;
    diagnostics.button = false;
    global_lsp_settings.button = false;

    # AI
    disable_ai = true;

    # Other
    auto_update = false;
    telemetry = {
      diagnostics = false;
      metrics = false;
    };
    suggest_extensions = false;
    session.trust_all_worktrees = true;
  };
}
