{ lib, vimUtils, fetchFromGitHub }:
vimUtils.buildVimPlugin {
  pname = "oscura.nvim";
  version = "2025-04-28";
  src = fetchFromGitHub {
    owner = "webhooked";
    repo = "oscura.nvim";
    rev = "0a2618636141c40db1e790ff396d597a6c4d34b8";
    sha256 = "sha256-5sufI82iNTnfa6MHk48ZV3ufjelgbCMF9nwyYD6Rti0=";
  };
}
