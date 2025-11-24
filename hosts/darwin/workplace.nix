{
  my.user.uid = 502;

  my.presets = {
    copilot.enable = true;
    typescript.enable = true;
    devOps.enable = true;
  };

  # Jamf enforces its own hostname rules, so we can't rely on the
  # default host value
  my.programs.up.target = "workplace";

  my.programs.parallels.enable = true;
}
