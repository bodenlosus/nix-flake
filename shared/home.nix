{ pkgs, config, ... }: {
  programs.gh = {
    enable = true;
  };
  home.packages = with pkgs; [
    # Apps
    discord # Chat
    bitwarden # Password manager
    vlc # Video player
    blanket # White-noise app
    microsoft-edge-beta
    zen-browser
    obsidian

    # Dev
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
    btop

    # nixshit
    gh
    nixpkgs-fmt
    nixpkgs-lint
    nil
    nixd

    # Just cool
    peaclock
    cbonsai
    pipes
    cmatrix
    cava

    # Backup
    vscode
    firefox
    neovide
  ];
}
