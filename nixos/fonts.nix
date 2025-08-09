{ pkgs, inputs, ... }:
{

  fonts = {
    packages = with pkgs; [
      roboto
      work-sans
      comic-neue
      source-sans
      comfortaa
      inter
      lato
      lexend
      jost
      dejavu_fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerd-fonts.fira-code
      nerd-fonts.meslo-lg
      openmoji-color
      twemoji-color-font
      fira-code
      corefonts
    ];

    enableDefaultPackages = false;

    fontconfig = {
      defaultFonts = {
        monospace = [
          "FiraCode Nerd Font Mono"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "FiraCode Nerd Font"
          "Noto Color Emoji"
        ];
        serif = [
          "FiraCode Nerd Font"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
