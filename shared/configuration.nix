{ pkgs, inputs, ... }: {

  imports = [
    # ../home/system/gnome/system.nix
    ../home/system/niri/system.nix
    ../nixos/printing.nix
    ../home/programs/flatpak/system.nix
  ];
  stylix.targets.plymouth.enable = true;
  services.gvfs.enable = true;
}
