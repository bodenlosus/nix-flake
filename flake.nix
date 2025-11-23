{
  inputs = {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:NixOS/nixpkgs/d63430ebdea82f70909f97511ce820258ae09ccd";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.niri-unstable.url = "github:YaLTeR/niri/73ca3964d5bb6aa362c9dbfd826ced48fc37edae";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    palettify = {
      url = "github:bodenlosus/palettify-rust";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nur.url = "github:nix-community/NUR";

    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dgop = {
      url = "github:AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms-cli = {
      url = "github:AvengeMedia/danklinux";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
      inputs.dms-cli.follows = "dms-cli";
    };
  };

  outputs =
    inputs@{ nixpkgs, ... }:
    let
      system = "x86_64-linux";
      utils = import ./utils.nix { inherit nixpkgs inputs; };
      overlays = [
        # inputs.hyprpanel.overlay
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
        mango.nixosModules.mango
        nix-flatpak.nixosModules.nix-flatpak
        nixos-hardware.nixosModules.lenovo-thinkpad-t14 # DONE: CHANGEME: check https://github.com/NixOS/nixos-hardware
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix
        niri.nixosModules.niri
      ];

    in
    {
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
