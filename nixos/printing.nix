{ pkgs, ... }:
{
  services.printing = {
    enable = true;
    webInterface = true;
    drivers = with pkgs; [ hplip ];
  };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

}
