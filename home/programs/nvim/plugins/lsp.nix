{
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        biome.enable = true;
        blueprint_ls.enable = true;
        cmake.enable = true;
        csharp_ls.enable = true;
        css_variables = {
          enable = true;
          package = null;
        };
        cssls.enable = true;
        cssmodules_ls = {
          enable = true;
          package = null;
        };
        dockerls.enable = true;
        jsonls.enable = true;
        ltex.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        mesonlsp.enable = true;
        postgres_lsp.enable = true;
        pyright.enable = true;
        # rust_analyzer = {
        #   enable = true;
        #   installRustc = false;
        #   installCargo = false;
        # };
        swift_mesonls.enable = true;
        systemd_ls.enable = true;
        gopls.enable = true;
        ts_ls.enable = true;
        nixd.enable = true;
        tailwindcss.enable = true;
        html.enable = true;
        svelte.enable = true;
        sourcekit.enable = true;
        vhdl_ls.enable = true;
      };
    };
    none-ls = {
      enable = true;
      sources = {
        diagnostics = {
          golangci_lint.enable = true;
          statix.enable = true;
        };
        formatting = {
          biome.enable = true;
          black.enable = true;
          swift_format.enable = true;
          yamlfmt.enable = true;
          gofmt.enable = true;
          goimports.enable = true;
          nixfmt.enable = true;
          markdownlint.enable = true;
          tidy.enable = true;
          shellharden.enable = true;
          shfmt.enable = true;
          golines.enable = true;
          gofumpt.enable = true;
        };
      };
    };
  };
}
