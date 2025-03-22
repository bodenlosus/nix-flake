{ nixpkgs, inputs, ... }:
{
  mkDesktopSystem = { system, overlays, modules, config }: nixpkgs.lib.nixosSystem {
    system = system;
    modules = [
      {
        nixpkgs.overlays = overlays;

        _module.args = { inherit inputs; };
      }

      config # DONE: CHANGEME: change the path to match your host folder
    ] ++ modules;
  };
}
