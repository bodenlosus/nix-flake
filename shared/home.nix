{
  pkgs,
  config,
  inputs,
  ...
}:
{
  imports = [

    ../home/system/dms
    ../home/programs/obsidian
    ../home/programs/direnv
    ../home/programs/btop
    # ../home/programs/cava
    ../home/system/niri
    # ../home/system/mango
    ../home/system/gtk
    ../home/system/wofi
    ../home/system/batsignal
    ../home/system/zathura
    ../home/system/mime
    ../home/system/udiskie
    ../home/system/clipman
    ../home/system/tofi
    ../home/system/vicinae
    ../home/scripts
    ../home/programs/kitty
    ../home/programs/ollama
    ../home/programs/ollama
    ../home/programs/shell
    # ../home/programs/fetch
    ../home/programs/git
    ../home/programs/spicetify
    ../home/programs/yazi
    ../home/programs/nautilus
    ../home/programs/lazygit
    ../home/programs/zed
    ../home/programs/helix
    ../home/programs/nextcloud
    ../home/programs/lsp
    ../home/programs/gowall
    # ../home/programs/kakoune
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
    clock-rs
    vicinae

    proton-pass
    protonmail-desktop

    zen-browser
    obsidian
    vscode
    kdePackages.kdenlive

    # gnome
    bustle

    # office
    libreoffice-fresh
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

    # palettify
  ];
}
