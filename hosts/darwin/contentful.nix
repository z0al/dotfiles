{
  # Home manager
  d.hm = [{
    d.apps = {
      brave.withOkta = true;
    };

    d.cli = {
      aws.enable = true;
      kubectl.enable = true;
      terraform.enable = true;
    };
  }];
}
