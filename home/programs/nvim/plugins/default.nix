{pkgs, ...}:
{
  programs.nixvim.options = {
      extraPlugins = with pkgs.vimPlugins; [
         {plugin = nvchad-ui; config = ''
function()
  require "nvchad" 
end
         '';}
      ];
   };
}