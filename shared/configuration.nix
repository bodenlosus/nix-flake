{ pkgs, ... }: {
  imports = [
    ../nixos/printing.nix
  ];
  stylix.targets.plymouth.enable = true;
}
