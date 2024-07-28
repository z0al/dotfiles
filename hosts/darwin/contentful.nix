{
  d.programs = {
    aws.enable = true;
    docker.enable = true;
    terraform.enable = true;
  };

  my.osUser.uid = 502;

  my.user = {
    # Jamf enforces its own hostname rules, so we can't rely on the
    # default host value
    home.shellAliases = {
      up = "up --host contentful";
    };

    d.cli = {
      kubectl.enable = true;
    };
  };
}
