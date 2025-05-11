{ inputs, ... }: {
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak.packages = [
    {
      appId = "re.sonny.Workbench";
      origin = "flathub";
    }
    {
      appId = "com.brave.Browser";
      origin = "flathub";
    }
    {
      appId = "org.gaphor.Gaphor";
      origin = "flathub";
    }
  ];

}
