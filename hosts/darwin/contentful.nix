{
  d.programs = {
    docker.enable = true;
  };

  my.user = {
    # Jamf enforces its own hostname rules, so we can't rely on the
    # default host value
    d.shell.aliases = {
      up = "up --host contentful";
    };

    d.cli = {
      aws.enable = true;
      kubectl.enable = true;
      terraform.enable = true;
    };
  };
}
