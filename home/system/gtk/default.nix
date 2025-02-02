# GTK & QT theme configuration
{ config, pkgs, lib, ... }:
{
  qt = {
    enable = true;
    platformTheme = {
      name = "gtk";
    };
    style.name = "adwaita-dark";
  };

  gtk = {
    enable = true;
    # theme = lib.mkForce {
    #   package = pkgs.whitesur-gtk-theme.override {
    #     themeVariants = [ "grey" "red" ];
    #     colorVariants = [ "Dark" ];
    #     nordColor = false;
    #   };

    #   name = "WhiteSur-Dark-grey";
    # };

    # theme = lib.mkForce {
    #   package = pkgs.colloid-gtk-theme.override {
    #     themeVariants = [ "grey" "red" "green" ];
    #     colorVariants = [ "dark" ];
    #     tweaks = [ "all" ];
    #   };

    #   name = "Colloid-Green-Dark-Everforest";
    # };

    theme = lib.mkForce {
      package = pkgs.adw-gtk3;

      name = "adw-gtk3";
    };

    iconTheme = {
      package = pkgs.whitesur-icon-theme.override {
        themeVariants = [ "all" ];
        alternativeIcons = true;
      };
      name = "WhiteSur";
    };

    # iconTheme = {
    #   package = pkgs.nordzy-icon-theme;
    #   name = "Nordzy-dark";
    # };

    font = { name = config.stylix.fonts.sansSerif.name; };

    gtk3.extraConfig = { gtk-application-prefer-dark-theme = 1; };

    gtk4.extraConfig = { gtk-application-prefer-dark-theme = 1; };
  };
}
