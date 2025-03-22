{ pkgs, ... }:
let custom-schemes = import ./colors {inherit pkgs;};
in
{
  programs.nixvim.colorschemes = {
    # tokyonight = {
    #   enable = true;
    # };
    # catppuccin = {
    #   enable = true;
    #   autoLoad = true;
    # }
    # oxocarbon = {
    #   enable = true;
    #   autoLoad = true;
    # };
    # poimandres = {
    #   enable = true;
    #   autoLoad = true;
    # };
  };
  programs.nixvim = {
    extraPlugins = with pkgs.vimPlugins; [
      embark-vim
      adwaita-nvim
      vim-horizon
      aurora
    ] ++ ( with custom-schemes; [tdark nordic]);
    colorscheme = "nordic";
  };
}
