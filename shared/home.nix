{ pkgs, config, inputs, ... }: {
  imports = [
    # ../home/system/wpaperd
    ../home/programs/direnv
    ../home/programs/btop
    ../home/programs/cava
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
    vscode
    palettify

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
    loupe
    totem
    evince

    # Backup
    firefox
  ];
}
