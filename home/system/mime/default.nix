# Mime allows us to configure the default applications for each file type
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/markdown" = "code.desktop";
      "text/plain" = "code.desktop";
      "text/x-shellscript" = "code.desktop";
      "text/x-python" = "code.desktop";
      "text/x-go" = "code.desktop";
      "text/css" = "code.desktop";
      "text/javascript" = "code.desktop";
      "text/x-c" = "code.desktop";
      "text/x-c++" = "code.desktop";
      "text/x-java" = "code.desktop";
      "text/x-rust" = "code.desktop";
      "text/x-yaml" = "code.desktop";
      "text/x-toml" = "code.desktop";
      "text/x-dockerfile" = "code.desktop";
      "text/x-xml" = "code.desktop";
      "text/x-php" = "code.desktop";
      "image/png" = "loupe.desktop";
      "image/jpeg" = "loupe.desktop";
      "image/jpg" = "loupe.desktop";
      "image/webp" = "loupe.desktop";
      "image/gif" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "text/html" = "zen.desktop";
      "application/pdf" = "evince.desktop";
    };
  };
}
