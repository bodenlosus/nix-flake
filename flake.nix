{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland.url =
      "github:hyprwm/Hyprland/29e2e59fdbab8ed2cc23a20e3c6043d5decb5cdc";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    palettify.url = "github:bodenlosus/palettify-rust";
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
      utils = import ./utils.nix { inherit nixpkgs inputs; };
      overlays = [
        inputs.hyprpanel.overlay
        inputs.nur.overlays.default
        inputs.niri.overlays.niri
        (final: prev: {
          zen-browser = inputs.zen-browser.packages."${system}".beta;
        })
        (final: prev: {
          palettify = inputs.palettify.packages."${system}".default;
        })
      ];
      modules = with inputs; [
        nixos-hardware.nixosModules.lenovo-thinkpad-t14 # DONE: CHANGEME: check https://github.com/NixOS/nixos-hardware
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
        niri.nixosModules.niri
      ];

    in {
      nixosConfigurations = {
        nixos = utils.mkDesktopSystem {
          inherit system overlays modules;
          config = ./hosts/nixos/configuration.nix;
        };
        nixpc = utils.mkDesktopSystem {
          inherit system overlays modules;
          config = ./hosts/nixpc/configuration.nix;
        };
      };

    };
}
