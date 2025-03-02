{ pkgs, config, inputs, ... }: {

  imports = [
    ./variables.nix

    ../../shared/home.nix


    # System (Desktop environment like stuff)
    # ../../home/system/hyprland
    # ../../home/system/hypridle
    # ../../home/system/hyprpanel
    # ../../home/system/hyprpaper
    # ../../home/system/gtk
    # ../../home/system/wofi
    # ../../home/system/batsignal # doesnt make sense on a desktop lol 

    # ./secrets # CHANGEME: You should probably remove this line, this is where I store my secrets
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    # Import my profile picture, used by the hyprpanel dashboard

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
