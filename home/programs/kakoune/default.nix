{ pkgs, ... }:
let
  utils = import ./cfg.nix { inherit pkgs; };
  kakoune = utils.kakouneConfig {
    config = "";
    plugins = with pkgs.kakounePlugins; [
      fzf-kak
      tabs-kak
      kakboard
      case-kak
      kakoune-buffers
      kakoune-easymotion
      auto-pairs-kak
      kakoune-state-save
      kakoune-vertical-selection
    ];
  };
in
{
  home.packages = [
    kakoune
    pkgs.kak-lsp
    pkgs.kak-tree-sitter
  ];
}
