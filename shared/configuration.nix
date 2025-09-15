{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    libfaketime
  ];
  xdg.terminal-exec.settings.default = ["kitty.desktop"];
  imports = [
    # ../home/system/gnome/system.nix
    ../home/system/niri/system.nix
    ../nixos/printing.nix
    ../nixos/docker.nix
    # ../home/programs/flatpak/system.nix
  ];
  stylix.targets.plymouth.enable = true;
  services.gvfs.enable = true;
}
