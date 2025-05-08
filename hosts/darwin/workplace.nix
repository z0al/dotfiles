{
  my.user.uid = 502;

  d.presets = {
    copilot.enable = true;
    typescript.enable = true;
    devOps.enable = true;

  };

  d.programs.brave.extensions = [
    {
      name = "Okta";
      id = "glnpjglilkicbckjpbgcfkogebgllemb";
      pinned = true;
    }
  ];

  # Jamf enforces its own hostname rules, so we can't rely on the
  # default host value
  d.programs.up.target = "workplace";
}
