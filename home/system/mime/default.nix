# Mime allows us to configure the default applications for each file type
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/markdown" = "neovide.desktop";
      "text/plain" = "neovide.desktop";
      "text/x-shellscript" = "neovide.desktop";
      "text/x-python" = "neovide.desktop";
      "text/x-go" = "neovide.desktop";
      "text/css" = "neovide.desktop";
      "text/javascript" = "neovide.desktop";
      "text/x-c" = "neovide.desktop";
      "text/x-c++" = "neovide.desktop";
      "text/x-java" = "neovide.desktop";
      "text/x-rust" = "neovide.desktop";
      "text/x-yaml" = "neovide.desktop";
      "text/x-toml" = "neovide.desktop";
      "text/x-dockerfile" = "neovide.desktop";
      "text/x-xml" = "neovide.desktop";
      "text/x-php" = "neovide.desktop";
      "image/png" = "loupe.desktop";
      "image/jpeg" = "loupe.desktop";
      "image/jpg" = "loupe.desktop";
      "image/webp" = "loupe.desktop";
      "image/gif" = "floorp.desktop";
      "x-scheme-handler/http" = "floorp.desktop";
      "x-scheme-handler/https" = "floorp.desktop";
      "text/html" = "floorp.desktop";
      "application/pdf" = "evince.desktop";
    };
  };
}
