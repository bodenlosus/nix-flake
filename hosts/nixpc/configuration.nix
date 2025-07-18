{ config, ... }: {
  imports = [
    ../../nixos/amd.nix # GPU SHIT FOR AMD
    ../../nixos/audio.nix
    ../../nixos/auto-upgrade.nix
    ../../nixos/bluetooth.nix
    ../../nixos/fonts.nix
    ../../nixos/home-manager.nix
    ../../nixos/network-manager.nix
    ../../nixos/nix.nix
    ../../nixos/systemd-boot.nix
    ../../nixos/timezone.nix
    ../../nixos/tuigreet.nix
    ../../nixos/users.nix
    ../../nixos/utils.nix
    ../../nixos/xdg-portal.nix
    ../../nixos/variables-config.nix
    ../../nixos/qemu.nix

    ../../themes/stylix/nixy.nix

    ../../shared/configuration.nix

    ./hardware-configuration.nix
    ./variables.nix
  ];

  services.gvfs.enable = true;

  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  home-manager.users."${config.var.username}" = import ./home.nix;
  home-manager.backupFileExtension = "backup";
  # Don't touch this
  system.stateVersion = "25.05";
}
