{ pkgs, ... }:
let
  utils = import ./cfg.nix { inherit pkgs; };
  kakoune = utils.kakouneConfig {
    config = "";
    plugins = with pkgs.kakounePlugins; [
      ka
    ];
  };
in
{
  home.packages = [ kakoune pkgs.kak-lsp pkgs.kak-tree-sitter];
}
