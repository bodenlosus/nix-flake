{
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [
    ../home/programs/obsidian
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
    ../home/programs/kitty
    ../home/programs/shell
    ../home/programs/fetch
    ../home/programs/git
    ../home/programs/spicetify
    ../home/programs/yazi
    ../home/programs/markdown
    ../home/programs/nautilus
    ../home/programs/lazygit
    ../home/programs/zed
    ../home/programs/helix
    ../home/programs/flatpak
    ../home/programs/nextcloud
  ];
  programs.gh = {
    enable = true;
  };
  home.packages = with pkgs; [
    # Apps
    # jetbrains.rust-rover
    vesktop # Chat
    vlc # Video player
    blanket # White-noise app
    pomodoro-gtk

    zen-browser
    obsidian
    vscode
    kdePackages.kdenlive

    # gnome
    bustle

    # office
    onlyoffice-desktopeditors

    # Dev
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

    # multimedia
    pavucontrol
    loupe
    totem
    evince

    # Backup
    firefox
  ];
}
