{ pkgs, ... }:
let
  toml = pkgs.formats.toml { };
in
{
  imports = [
    ./themes/default.nix
    ./settings.nix
    ./languages.nix
  ];
  home.packages = with pkgs; [
    helix
    rustc
    rust-analyzer
    rustfmt
    clippy
    cargo
    pkg-config
    cargo
    cargo-deny
    cargo-edit
    cargo-watch
    rust-analyzer
    rustc
    wgsl-analyzer
  ];

  programs.helix = {
    enable = true;
    defaultEditor = true;

  };

}
