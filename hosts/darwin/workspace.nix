{ pkgs, ... }:

{
  my.username = "ahmed.tajelsir";
  my.user.uid = 502;

  my.programs = {
    cursor.enable = true;
    dbeaver.enable = true;
    kubectl.enable = true;
    kubelogin.enable = true;
  };

  # Add the keychain's network CA to the system CA bundle.
  environment.etc."ssl/certs/ca-certificates.crt".enable = false;
  system.activationScripts.postActivation.text = ''
    cat ${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt \
      <(/usr/bin/security find-certificate -a -c "Gateway CA" -p) \
      > /etc/ssl/certs/ca-certificates.crt
  '';
}
