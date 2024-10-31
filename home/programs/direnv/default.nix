{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    programs.direnv.package = pkgs.direnv;
    programs.direnv.nix-direnv.package = pkgs.nix-direnv;
    programs.direnv.nix-direnv.enable = true;
    programs.direnv.enableZshIntegration = true;
  };
}