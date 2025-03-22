{ pkgs, inputs, ... }: {
  imports = [
    ../home/system/niri/system.nix
    ../nixos/printing.nix
  ];
  stylix.targets.plymouth.enable = true;
  services.gvfs.enable = true;
}
