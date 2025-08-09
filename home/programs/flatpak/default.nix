{ inputs, ... }: {
  imports = [ inputs.nix-flatpak.homeManagerModules.nix-flatpak ];

  services.flatpak.packages = [
    {
      appId = "re.sonny.Workbench";
      origin = "flathub";
    }
    {
      appId = "org.gaphor.Gaphor";
      origin = "flathub";
    }
    {
      appId = "org.gnome.Sdk";
      origin = "flathub";
    }
    {
      appId = "org.gnome.Platform";
      origin = "flathub";
    }
  ];
}
