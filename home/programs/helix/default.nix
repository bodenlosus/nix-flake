{ pkgs, ... }:
let
  toml = pkgs.formats.toml { };
in
{
  imports = [ ./themes/default.nix ./settings.nix ./languages.nix ];
  home.packages = with pkgs; [ helix ];

  programs.helix = {
    enable = true;
    defaultEditor = true;

  };


}
