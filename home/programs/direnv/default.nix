{
  # ...other config, other config...

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };
}
