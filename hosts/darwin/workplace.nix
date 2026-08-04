{
  my.user.uid = 502;

  my.presets = {
    typescript.enable = true;
    devOps.enable = true;
  };

  # Jamf enforces its own hostname rules, so we can't rely on the
  # default host value
  my.programs.up.target = "workplace";

  my.programs.parallels.enable = false;

  my.programs.claude-code.settings = {
    model = "sonnet";
    env = {
      ANTHROPIC_BASE_URL = "https://ai-gateway.contentful.tools/";
    };
  };
}
