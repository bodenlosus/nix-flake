{ lib, pkgs, ... }:
{
  wayland.windowManager.hyprland.settings.exec-once =
    [ "wpaperd -d" ];
  programs.wpaperd = {
    enable = true;
    package = pkgs.wpaperd;

    settings = {
      default = {
        duration = "30min";
        mode = lib.mkForce "center";
        sorting = "ascending";
      };
      any = {
        path = lib.mkForce "~/Pictures/wallpapers";
        mode = lib.mkForce "center";
      };
    };
  };
}
