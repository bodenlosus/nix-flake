{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    # Path to your private key (ensure this file exists on all devices)
    age.keyFile = "/home/johannes/.config/sops/age/keys.txt";
    defaultSopsFile = ./secrets.yaml;

    secrets = {
      gemini_api_key = { };
    };
  };

  home.packages = with pkgs; [
    sops
    age
  ];

  # This makes the key available to the gemini-cli automatically
  home.sessionVariables = {
    GOOGLE_API_KEY = "hi ${config.sops.secrets.gemini_api_key.path}";
  };

  # Ensures secrets are decrypted on login
  wayland.windowManager.hyprland.settings.exec-once = [
    "systemctl --user start sops-nix"
  ];
}
