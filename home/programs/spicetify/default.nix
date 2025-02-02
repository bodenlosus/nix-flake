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
    theme = lib.mkForce spicePkgs.themes.blossom;

    colorScheme = "custom";
    customColorScheme =
      rec {
        text = "${colors.base07}";
        subtext = "${colors.base03}";
        extratext = "${colors.base04}";
        background = "${colors.base00}";
        player = "${colors.base02}";
        main = background;
        sidebar = "${colors.base01}";
        card = player;
        button = "${colors.base08}";
        button-active = button;
        button-disabled = "${colors.base03}";      
      };
    alwaysEnableDevTools = true;
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
