{ pkgs, ... }: {
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = true;
    desktopManager.gnome.enable = true;
    excludePackages = [ pkgs.xterm ];
  };
  environment.gnome.excludePackages = with pkgs; [
    gnome-text-editor
    epiphany
    gnome-tour
    gnome-photos
    geary
    yelp
    gnome-calculator
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-maps
    gnome-weather
    evolution
    fractal
    fractal-next
    seahorse
    baobab
    gnome-calendar
    gnome-logs
    gnome-music
  ];
}
