# Spicetify is a spotify client customizer
{ pkgs, config, lib, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  accent = "${config.lib.stylix.colors.base0D}";
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [ "spotify" ];

  stylix.targets.spicetify.enable = false;

  programs.spicetify = {
    enable = true;
    theme = lib.mkForce spicePkgs.themes.comfy;

    colorScheme = lib.mkForce "nord";

    customColorScheme = lib.mkForce {
      button = accent;
      button-active = accent;
      tab-active = accent;
    };

    enabledExtensions = with spicePkgs.extensions; [
      fullAlbumDate
      playlistIcons
      lastfm
      historyShortcut
      hidePodcasts
      adblock
      fullAppDisplay
      shuffle
    ];
  };
}
