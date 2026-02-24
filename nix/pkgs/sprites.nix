{ lib, stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "sprite";
  version = "0.0.1-rc38";

  src = fetchurl {
    url = "https://sprites-binaries.t3.storage.dev/client/v${version}/sprite-darwin-arm64.tar.gz";
    sha256 = "0rg2d14rdmy0hlk20rw0q2cjq8mdci0hwq5vj6vd47y70hh5qxrp";
  };

  sourceRoot = ".";

  installPhase = ''
    mkdir -p $out/bin
    cp sprite $out/bin/sprite
    chmod +x $out/bin/sprite
  '';

  meta = {
    description = "Sprites CLI - manage hardware-isolated sandbox environments";
    homepage = "https://sprites.dev";
    platforms = [ "aarch64-darwin" ];
    mainProgram = "sprite";
  };
}
