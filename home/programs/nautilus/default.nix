# My shell configuration
{ pkgs, lib, config, ... }:
{
  home.packages = with pkgs; [ nautilus sushi nautilus-open-any-terminal ];
}
