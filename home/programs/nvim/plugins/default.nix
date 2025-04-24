{ ... }: {
  imports = [
    ./typescript.nix
    ./colorizer.nix
    ./lsp.nix
    ./cmp.nix
    ./treesitter.nix
    ./direnv.nix
    ./nix.nix
    ./util.nix
    ./telescope.nix
    ./auto-session.nix
    ./rust.nix
  ];
  programs.nixvim.plugins = {
    auto-save.enable = true;
    # Status line
    lualine = {
      enable = true;
      settings.options.theme = "auto";
    };

    # Buffer line for tabs
    bufferline = {
      enable = true;

      settings.options.diagnostics = "nvim_lsp";
    };

    # File explorer
    nvim-tree = {
      enable = true;
      openOnSetup = true;
      view.side = "right";
    };

    # Command palette and UI improvements
    noice = { enable = true; };

    # Better UI elements
    dressing = { enable = true; };

    web-devicons.enable = true;

    # Which-key for keybinding help
    which-key = { enable = true; };

    # Indent guides
    indent-blankline = { enable = true; };

    treesitter-context.enable = true;
    # Colorschemes
    nvim-surround.enable = true;
    project-nvim.enable = true;
  };
}
