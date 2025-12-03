{ pkgs, config, inputs, ... }: {

  imports = [
    ./variables.nix

    ../../shared/home.nix

    # Programs
    ../../home/programs/kitty
    ../../home/programs/shell
    ../../home/programs/git
    ../../home/programs/spicetify
    ../../home/programs/yazi
    ../../home/programs/nautilus
    ../../home/programs/lazygit

    # Scripts
    ../../home/scripts # All scripts

    # ./secrets # CHANGEME: You should probably remove this line, this is where I store my secrets
  ];

  home = {
    inherit (config.var) username;
    homeDirectory = "/home/" + config.var.username;

    # Import my profile picture, used by the hyprpanel dashboard

    # Don't touch this
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;
}
