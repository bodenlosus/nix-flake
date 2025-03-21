# Nixvim is a NixOS module that installs and configures Neovim
{ inputs, pkgs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim.enable = true;
}