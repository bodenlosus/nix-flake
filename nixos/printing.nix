{pkgs, ...}:
{
  services.printing = { 
    enable = true;
    webInterface = true;
    drivers = [ pkgs.hplip ];
    };
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  
}