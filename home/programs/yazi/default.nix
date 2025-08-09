# Yazi is a TUI file explorer
{pkgs, ...}: {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    package = pkgs.yazi.override {_7zz = pkgs._7zz-rar; };
    settings = {
      log = { enabled = false; };
      manager = {
        show_hidden = true;
        sort_by = "mtime";
        sort_dir_first = true;
        sort_reverse = true;
        show_symlink = true;
      };
    };
  };
}
