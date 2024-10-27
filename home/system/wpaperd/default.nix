{ lib, pkgs, ... }:
{
  programs.wpaperd = {
    enable = true;
    package = pkgs.wpaperd;

    settings = {
      default = {
        duration = "30min";
        mode = "center";
        sorting = "ascending";
        path = lib.mkForce ../../../wallpapers/ign_lighthouse.png;
      };
      any = {
        path = lib.mkForce ../../../wallpapers;
      };
    };
  };
}
