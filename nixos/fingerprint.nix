{
  services.fprintd.enable = true;
  security.pam.services = {
    greetd.fprintLocation = true;
    sudo.fprintLocation = true;
    polkit-1.fprintLocation = true;
  };
}
