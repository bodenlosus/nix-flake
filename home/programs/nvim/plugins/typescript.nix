{
  programs.nixvim.plugins = {
    typescript-tools = {
      enable = true;

    };
    ts-autotag = {
      settings = {
        opts = {
          enable_close = true;
          enable_close_on_slash = false;
          enable_rename = true;
        };
        per_filetype = { };
      };
    };
    tailwind-tools.enable = true;
  };
}
