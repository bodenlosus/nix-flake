{ lib
, pkg-config
, hyprland
, cmake
, fetchFromGitHub
, nix-update-script
, stdenv
,
}:

hyprland.stdenv.mkDerivation {
  pname = "hyprscroller";
  version = "0-unstable-2025-01-21";

  src = fetchFromGitHub {
    owner = "dawsers";
    repo = "hyprscroller";
    rev = "ce7503685297d88e0bb0961343ed3fbed21c559c";
    hash = "sha256-3pGIe4H1LUOJw0ULfVwZ7Ph7r/AyEipx7jbWP7zz3MU=";
  };

  nativeBuildInputs = [ pkg-config cmake hyprland ];
  buildInputs = [ hyprland ] ++ hyprland.buildInputs;

  # Ensure the plugin is linked against the correct libraries
  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  installPhase = ''
    mkdir -p $out/lib
    cp hyprscroller.so $out/lib/libhyprscroller.so
  '';

  # passthru.updateScript = nix-update-script { extraArgs = [ "--version=branch" ]; };

  meta = {
    homepage = "https://github.com/dawsers/hyprscroller";
    description = "Hyprland layout plugin providing a scrolling layout like PaperWM";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ donovanglover ];
    platforms = lib.platforms.linux;
  };
}
