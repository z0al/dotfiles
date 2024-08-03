{
  my.osUser.uid = 502;

  d.profiles = {
    dev = {
      enable = true;
      copilot.enable = true;
      javascript.enable = true;
      ops.enable = true;
    };
  };

  # Jamf enforces its own hostname rules, so we can't rely on the
  # default host value
  d.programs.up.target = "workplace";
}
