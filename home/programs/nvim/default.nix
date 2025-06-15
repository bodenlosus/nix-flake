# Nixvim is a NixOS module that installs and configures Neovim
{ inputs, ... }: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins/default.nix
    ./colors.nix
    ./options.nix
    ./keymap.nix
  ];
  programs.neovide = {
    enable = true;
    settings = {
      fork = true;
      title-hidden = true;
      frame = "full";
      srgb = false;
      font = {
        size = 11;
        normal = [{ family = "JetBrainsMono Nerd Font"; }];
      };
    };
  };

  programs.nixvim.enable = true;
  stylix.targets.neovim.enable = false;
  stylix.targets.nixvim.enable = false;
}
