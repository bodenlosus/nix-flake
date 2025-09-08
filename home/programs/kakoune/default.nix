{ pkgs, ... }:
let
  utils = import ./cfg.nix { inherit pkgs; };
  kakoune = utils.kakouneConfig {
    config = "";
    plugins = with pkgs; [
      kakoune-lsp
    ];
  };
in
{
  home.packages = [ kakoune ];
}
