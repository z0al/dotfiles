{ pkgs, ... }:

{
  my.username = "ahmed.tajelsir";
  my.user.uid = 502;

  my.profiles = {
    claude.enable = true;
    codex.enable = true;
    desktop.enable = true;
    github.enable = true;
  };

  my.programs = {
    _1password.enable = true;
    coder.enable = true;
    cursor.enable = true;
    dbeaver.enable = true;
    vscode.enable = true;
  };

  # Add the keychain's network CA to the system CA bundle.
  environment.etc."ssl/certs/ca-certificates.crt".enable = false;
  system.activationScripts.postActivation.text = ''
    cat ${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt \
      <(/usr/bin/security find-certificate -a -c "Gateway CA" -p) \
      > /etc/ssl/certs/ca-certificates.crt
  '';
}
