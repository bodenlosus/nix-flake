{ pkgs, config, ... }: {
  imports = [
    ../home/system/wpaperd
    ../home/programs/direnv
    ../home/programs/btop
  ];
  programs.gh = {
    enable = true;
  };
  home.packages = with pkgs; [
    # Apps
    discord # Chat
    bitwarden # Password manager
    vlc # Video player
    blanket # White-noise app
    opera
    zen-browser
    obsidian
    vscode

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
