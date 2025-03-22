{pkgs,...}:
{
  tdark = pkgs.callPackage ./tdark.nix {};
  nordic = pkgs.callPackage ./nordic.nix {};
}
