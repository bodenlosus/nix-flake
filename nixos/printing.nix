{ pkgs, ... }: {
  services.printing = {
    enable = true;
    webInterface = true;
    drivers = with pkgs; [ hplip canon-cups-ufr2 canon-capt ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

}
