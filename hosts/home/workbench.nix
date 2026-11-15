{
  home.username = "ahmedtajelsir";

  profiles = {
    node.enable = true;
    python.enable = true;
  };

  programs = {
    claude-code.enable = true;
    codex.enable = true;
  };

  programs.up.target = "workbench";
}
