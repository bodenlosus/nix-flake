{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [ blueman bluez bluez-alsa ];
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
}
