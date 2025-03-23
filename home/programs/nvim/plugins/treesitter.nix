{ pkgs, ... }: {

  programs.nixvim.plugins.treesitter = {
    enable = true;
    autoLoad = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      #     blueprint
      c
      c_sharp
      cmake
      corn
      css
      csv
      dockerfile
      gitignore
      go
      html
      hyprlang
      ini
      javascript
      json
      latex
      lua
      make
      markdown
      meson
      nix
      python
      regex
      rust
      scss
      sql
      svelte
      swift
      tsx
      typescript
      toml
      vim
      vimdoc
      xml
      yaml
    ];
  };
}
