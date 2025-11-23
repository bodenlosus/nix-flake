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
      noto-fonts-color-emoji
      nerd-fonts.fira-code
      nerd-fonts.zed-mono
      nerd-fonts.meslo-lg
      roboto-serif
      inriafonts
      poly
      openmoji-color
      twemoji-color-font
      fira-code
      corefonts
    ];

    enableDefaultPackages = false;

    fontconfig = {
      defaultFonts = {
        monospace = [
          "ZedMono Font Mono"
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Inter"
          "Noto Color Emoji"
        ];
        serif = [
          "Poly"
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
