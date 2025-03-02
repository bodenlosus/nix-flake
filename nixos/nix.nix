{ config, inputs, lib, ... }:
let autoGarbageCollector = config.var.autoGarbageCollector;
in {
  nixpkgs.config = {
    allowUnfree = true;
    allowBroken = true;
    allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "copilot.vim"
    ];
  };
  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    channel.enable = false;
    extraOptions = ''
      warn-dirty = false
    '';
    settings = {
      extra-platforms = [ "aarch64-linux" ];
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://hyprland.cachix.org" "https://winapps.cachix.org/" ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "winapps.cachix.org-1:HI82jWrXZsQRar/PChgIx1unmuEsiQMQq+zt05CD36g="
      ];
    };
    gc = {
      automatic = autoGarbageCollector;
      persistent = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
}
