{ lib, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.exec-once =
    [ "wpaperd -d"];
  programs.wpaperd = {
    enable = true;
    package = pkgs.wpaperd;

    settings = {
      default = {
        duration = "30min";
        mode = "fit";
        sorting = "ascending";
      };
      any = {
        path = lib.mkForce ../../../wallpapers;
      };
    };
  };
}
