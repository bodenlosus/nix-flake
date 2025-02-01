# Spicetify is a spotify client customizer
{ pkgs, config, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};

  colors = config.lib.stylix.colors;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];


  stylix.targets.spicetify.enable = false;

  programs.spicetify = {
    enable = true;
    theme = lib.mkForce spicePkgs.themes.comfy;

    colorScheme = "custom";
    enabledCustomApps = with spicePkgs.apps; [
      marketplace
    ];
    customColorScheme =
      rec {
        text = "${colors.base07}";
        subtext = "${colors.base03}";
        main = "${colors.base01}";
        main-elevated = "${colors.base02}";
        main-transition = "${colors.base00}";
        highlight = "${colors.base04}";
        highlight-elevated = highlight;

        sidebar = "${colors.base00}";
        player = "${colors.base02}";
        card = "${colors.base02}";
        shadow = "#000000";
        selected-row = "${colors.base06}";
        button = "${colors.base0D}";
        button-active = button;
        button-disabled = "${colors.base04}";
        tab-active = card;
        notification = card;
        notification-error = "${colors.base08}";
        misc = "${colors.base07}";
        play-button = button;
        play-button-active = button-active;
        progress-fg = "${colors.base0D}";
        progress-bg = "${colors.base0C}";
        heart = button-active;
        pagelink-active = button-active;
        radio-btn-active = button-active;
      };

    enabledExtensions = with spicePkgs.extensions;
      [
        playlistIcons
        lastfm
        historyShortcut
        hidePodcasts
        adblock
        fullAppDisplay
        fullAlbumDate
        shuffle
        betterGenres
      ];
  };
}
