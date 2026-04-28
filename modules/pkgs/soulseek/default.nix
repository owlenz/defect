{ lib, stdenv, fetchurl }:

stdenv.mkDerivation {
  pname = "soulseek";
  version = "2024-6-30";

  src = fetchurl {
    url = "https://f004.backblazeb2.com/file/SoulseekQt/SoulseekQt-2024-6-30.AppImage";
    sha256 = "332d9369f0746f1fdd72c77027915983a155165800c9fab991c110601a870f3b";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin $out/libexec
    cp $src $out/libexec/soulseek.AppImage
    chmod +x $out/libexec/soulseek.AppImage
    cat > $out/bin/soulseek <<'EOF'
    #!/bin/sh
    export TMPDIR="${TMPDIR:-/tmp}"
    exec $out/libexec/soulseek.AppImage "$@"
    EOF
    chmod +x $out/bin/soulseek
    runHook postInstall
  '';

  meta = with lib; {
    description = "Wrapper for SoulseekQt AppImage";
    homepage = "https://www.soulseekqt.net";
    license = licenses.free;
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
  };
}
