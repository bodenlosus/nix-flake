{ lib, vimUtils, fetchFromGitHub }:
vimUtils.buildVimPlugin {
  pname = "tokyodark.nvim";
  version = "2024-04-28";
  src = fetchFromGitHub {
    owner = "tiagovla";
    repo = "tokyodark.nvim";
    rev = "cc70a2fb809d5376f2bd8e5836f9bb3f5fb8ef43";
    sha256 = "sha256-pEnA8s1666HYnHkpN1Xtni+W8vVy+AeUr5z7WY2RLo4=";
  };
}
