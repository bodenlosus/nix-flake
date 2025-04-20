{ lib, vimUtils, fetchFromGitHub }:
vimUtils.buildVimPlugin {
  pname = "nordic.nvim";
  version = "2024-04-28";
  src = fetchFromGitHub {
    owner = "AlexvZyl";
    repo = "nordic.nvim";
    rev = "8627750ece357e9670f9e69853091f7fbb8d6523";
    sha256 = "sha256-2uc4PHAQuuZe1UKY49jShQ3qVzTRV6Y2DsMKSem2Qqw=";
  };
}
