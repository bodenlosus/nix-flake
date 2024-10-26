{
  networking.networkmanager.enable = true;
  networking.networkmanager.ethernet.macAddress = "random";

  systemd.services.NetworkManager-wait-online.enable = false;
}
