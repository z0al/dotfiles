{
  d.profiles = {
    dev = {
      javascript.enable = true;
      ops.enable = true;
    };
  };

  my.osUser.uid = 502;

  environment.shellAliases = {
    # Jamf enforces its own hostname rules, so we can't rely on the
    # default host value
    up = "up --host workplace";
  };
}
