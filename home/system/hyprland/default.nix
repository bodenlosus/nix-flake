{ pkgs, ... }:
{
  imports = [
    ./binds.nix
    ./settings.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    # set the flake package
    package = pkgs.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };
}
