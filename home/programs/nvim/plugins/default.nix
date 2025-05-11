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
      settings.sections.lualine_x = [
        "diagnostics"
        {
          __unkeyed-1 = {
            __raw = ''
              function()
                  local msg = ""
                  local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                  local clients = vim.lsp.get_active_clients()
                  if next(clients) == nil then
                      return msg
                  end
                  for _, client in ipairs(clients) do
                      local filetypes = client.config.filetypes
                      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                          return client.name
                      end
                  end
                  return msg
              end
            '';
          };
          color = { fg = "#ffffff"; };
          icon = "";
        }
        "encoding"
        "fileformat"
        "filetype"
      ];
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
