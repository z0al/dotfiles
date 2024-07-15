{
  d.programs = {
    aws.enable = true;
    docker.enable = true;
    terraform.enable = true;
  };

  my.user = {
    # Jamf enforces its own hostname rules, so we can't rely on the
    # default host value
    d.shell.aliases = {
      up = "up --host contentful";
    };

    d.cli = {
      kubectl.enable = true;
    };
  };
}
