{ lib, fetchFromGitHub, rustPlatform, }:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "cosmic-ext-alternative-startup";
  version = "14.1.1";

  src = fetchFromGitHub {
    owner = "Drakulix";
    repo = "cosmic-ext-alternative-startup";
    rev = "8ceda00197c7ec0905cf1dccdc2d67d738e45417";
    hash = "sha256-0kqn3hZ58uQMl39XXF94yQS1EWmGIK45/JFTAigg/3M=";
  };

  cargoHash = "sha256-DeMkAG2iINGden0Up013M9mWDN4QHrF+FXoNqpGB+mg=";
})
