{ pkgs, ... }:
{
  environment.systemPackages = [
    (pkgs.ollama.override {
      acceleration = "rocm";
    })
  ];
}
