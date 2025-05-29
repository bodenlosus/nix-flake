{
  programs.nixvim.keymaps = [
    {
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
    }
    {
      key = "<leader>fg";
      action = "<cmd>Telescope live_grep<cr>";
    }
    {
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
    }
    {
      key = "<leader>fh";
      action = "<cmd>Telescope help_tags<cr>";
    }
    {
      mode = "n";
      key = "gcd";
      action = "<cmd>lua vim.diagnostic.open_float()<cr>";
      options = {
        desc = "Open diagnostic float window";
        silent = true;
      };
    }
  ];
}
