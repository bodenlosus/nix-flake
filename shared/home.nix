{ pkgs, config, inputs, ... }: {
  imports = [
    ../home/programs/direnv
    ../home/programs/btop
    ../home/programs/cava
    ../home/system/niri
    ../home/system/gtk
    ../home/system/wofi
    ../home/system/batsignal
    ../home/system/zathura
    ../home/system/mime
    ../home/system/udiskie
    ../home/system/clipman
    ../home/system/tofi
    ../home/scripts
    # ../home/system/waybar
    ../home/programs/kitty
    ../home/programs/shell
    ../home/programs/fetch
    ../home/programs/git
    ../home/programs/spicetify
    ../home/programs/yazi
    ../home/programs/markdown
    ../home/programs/nautilus
    ../home/programs/lazygit
    ../home/programs/nvim/default.nix
    # ../home/system/hyprland
    # ../home/system/hypridle
    # ../home/system/hyprpanel
    # ../home/system/hyprpaper
  ];
  programs.gh = {
    enable = true;
  };
  home.packages = with pkgs; [
    # Apps
    vesktop # Chat
    # bitwarden # Password manager
    vlc # Video player
    blanket # White-noise app
    pomodoro-gtk
    spot
    opera
    zen-browser
    obsidian
    planify
    vscode
    palettify

    # office
    onlyoffice-desktopeditors


    # Dev
    deno
    go
    nodejs
    python3
    jq
    figlet
    just

    # Utils
    zip
    unzip
    optipng
    pfetch
    pandoc
    overskride

    # nixshit
    nixpkgs-fmt
    nixpkgs-lint
    nil
    nixd

    # Just cool
    peaclock
    cbonsai
    pipes
    cmatrix

    # multimedia
    pavucontrol
    loupe
    totem
    evince

    # Backup
    firefox
  ];
}
