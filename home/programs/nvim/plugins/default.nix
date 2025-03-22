{ ... }:
{
  programs.nixvim.plugins = {
    # Status line
    lualine = {
      enable = true;
      theme = "auto";
    };

    # Buffer line for tabs
    bufferline = {
      enable = true;
      diagnostics = "nvim_lsp";
    };

    # File explorer
    nvim-tree = {
      enable = true;
      openOnSetup = true;
    };

    # Command palette and UI improvements
    noice = {
      enable = true;
    };

    # Better UI elements
    dressing = {
      enable = true;
    };

    # Which-key for keybinding help
    which-key = {
      enable = true;
    };

    # Indent guides
    indent-blankline = {
      enable = true;
    };

    # Colorschemes
  };
}
