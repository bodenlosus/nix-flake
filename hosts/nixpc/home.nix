{ pkgs, config, inputs, ... }: {

  imports = [
    ./variables.nix

    ../../shared/home.nix

    # Programs
    ../../home/programs/kitty
    ../../home/programs/shell
    ../../home/programs/fetch
    ../../home/programs/git
    ../../home/programs/spicetify
    ../../home/programs/nextcloud
    ../../home/programs/yazi
    ../../home/programs/markdown
    ../../home/programs/nautilus
    ../../home/programs/lazygit

    # Scripts
    ../../home/scripts # All scripts

    # System (Desktop environment like stuff)
    ../../home/system/hyprland
    ../../home/system/hypridle
    ../../home/system/hyprlock
    ../../home/system/hyprpanel
    ../../home/system/hyprpaper
    ../../home/system/gtk
    ../../home/system/wofi
    # ../../home/system/batsignal # doesnt make sense on a desktop lol 
    ../../home/system/zathura
    ../../home/system/mime
    ../../home/system/udiskie
    ../../home/system/clipman
    ../../home/system/tofi

    # ./secrets # CHANGEME: You should probably remove this line, this is where I store my secrets
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    # Import my profile picture, used by the hyprpanel dashboard
    file.".profile_picture.png" = { source = ./profile_picture.png; };

    # Don't touch this
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
