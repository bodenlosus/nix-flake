{ pkgs, config, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };
  niri-flake.cache.enable = false;
  environment.variables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    wl-clipboard
    wayland-utils
    libsecret
    cage
    gamescope
    xwayland-satellite-unstable
    swww
  ];
}
