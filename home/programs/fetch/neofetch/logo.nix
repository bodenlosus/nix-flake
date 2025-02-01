{ inkscape
, stdenv
}:

stdenv.mkDerivation {
  pname = "logo";
  version = "1.0";

  src = ./src;

  buildInputs = [ inkscape ];

  buildPhase = ''
    echo "Building..."
    inkscape -h 1024 logo.svg -o logo.png
    mkdir -p $out/logo
    cp logo.svg $out/logo
    cp logo.png $out/logo
  '';
}
