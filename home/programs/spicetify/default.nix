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
        subtext = "${colors.base04}";
        extratext = "${colors.base05}";
        background = "${colors.base00}";
        player = "${colors.base00}";
        main = background;
        sidebar = "${colors.base00}";
        card = "${colors.base01}";
        button = "${colors.base0D}";
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
