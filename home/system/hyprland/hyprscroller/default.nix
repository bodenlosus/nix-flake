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
    rev = "4769be4ba71dcf52bce6fa63c820228d01b0f436";
    hash = "sha256-SnVsSRDltmFKjTvJo3hecYqhoKzwlbVc/Vy57F5+j5Y=";
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
