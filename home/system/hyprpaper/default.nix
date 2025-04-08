# Hyprpaper is used to set the wallpaper on the system
{ lib, ... }:
{
  # The wallpaper is set by stylix
  services.hyprpaper = {
    enable = lib.mkForce false;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;
    };
  };
}
