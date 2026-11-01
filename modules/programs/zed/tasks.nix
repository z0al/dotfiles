{
  programs.zed-editor.userTasks = [
    {
      label = "LazyGit";
      command = "lazygit";
      cwd = "$ZED_WORKTREE_ROOT";
      reveal_target = "center";
      hide = "on_success";
      show_summary = false;
      show_command = false;
      use_new_terminal = true;
    }
  ];
}
