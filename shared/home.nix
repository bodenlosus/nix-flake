{ pkgs, config, ... }: {
  imports = [
    ../home/system/wpaperd
    ../home/programs/direnv
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
    microsoft-edge-beta
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
    btop

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
    cava

    # Backup
    firefox
    neovide
  ];
}
