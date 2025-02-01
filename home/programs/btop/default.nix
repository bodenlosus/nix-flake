{ pkgs, ... }:
{
  programs.btop = {
    enable = true;
    package = pkgs.btop;
  };
  stylix.targets.btop.enable = true;
}
