{ pkgs, inputs, ... }: {
  imports = [
    ../nixos/printing.nix
    ../home/system/sddm
  ];
  stylix.targets.plymouth.enable = true;
}
