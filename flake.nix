{
  # https://github.com/anotherhadi/nixy
  description = ''
    Nixy is a NixOS configuration with home-manager, secrets and custom theming all in one place.
    It's a simple way to manage your system configuration and dotfiles.
  '';

  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/585f76290ed66a3fdc5aae0933b73f9fd3dca7e3"; # temporary fix for rocm-llvm issue
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    palettify.url = "github:bodenlosus/palettify-rust";
    # # hyprspace = {
    #   url = "github:KZDKM/Hyprspace";

    #   # Hyprspace uses latest Hyprland. We declare this to keep them in sync.
    #   inputs.hyprland.follows = "hyprland";
    # };
    hyprpolkitagent.url = "github:hyprwm/hyprpolkitagent";
    hyprsunset.url = "github:hyprwm/hyprsunset";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    stylix.url = "github:danth/stylix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nur.url = "github:nix-community/NUR";
  };

  outputs = inputs@{ nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        nixos = # DONE: CHANGEME: This should match the 'hostname' in your variables.nix file
          nixpkgs.lib.nixosSystem {
            system = system;
            modules = [
              {
                nixpkgs.overlays = [
                  inputs.hyprpanel.overlay
                  inputs.nur.overlays.default
                  (final: prev: {
                    zen-browser = inputs.zen-browser.packages."${system}".beta;
                  })
                  (final: prev: {
                    palettify = inputs.palettify.packages."${system}".default;
                  })
                ];
                _module.args = { inherit inputs; };
              }
              inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14 # DONE: CHANGEME: check https://github.com/NixOS/nixos-hardware
              inputs.home-manager.nixosModules.home-manager
              inputs.stylix.nixosModules.stylix
              ./hosts/nixos/configuration.nix # DONE: CHANGEME: change the path to match your host folder
            ];
          };
        nixpc = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            {
              nixpkgs.overlays = [
                inputs.hyprpanel.overlay
                inputs.nur.overlays.default
                (final: prev: {
                  zen-browser = inputs.zen-browser.packages."${system}".beta;
                })
                (final: prev: {
                    palettify = inputs.palettify.packages."${system}".default;
                  })
                # (
                #   final: prev: {
                #     rocmPackages.llvm = prev.rocmPackages.llvm.override {
                #       buildDocs = false;

                #     };
                #   }
                # )
              ];
              _module.args = { inherit inputs; };
            }
            inputs.home-manager.nixosModules.home-manager
            inputs.stylix.nixosModules.stylix
            ./hosts/nixpc/configuration.nix # DONE: CHANGEME: change the path to match your host folder
          ];
        };
      };

    };
}
