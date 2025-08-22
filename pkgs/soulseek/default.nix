{
  lib,
  stdenv,
  fetchurl,
  src ? null
}: let
  appImageSrc = if src != null then src else fetchurl {
    url = "https://f004.backblazeb2.com/file/SoulseekQt/SoulseekQt-2024-6-30.AppImage";
    sha256 = "";
  };
  name = "Soulseek";
in
  stdenv.mkDerivation {
    pname = "Soulseek";
    src = appImageSrc;
    installPhase = ''
        mkdir -p $out/bin $out/libexec
        cp ${src} $out/libexec/${name}.AppImage
        chmod +x $out/libexec/${name}.AppImage

        cat > $out/bin/my-app <<'EOF'
    #!/bin/sh
    export TMPDIR="${TMPDIR:-/tmp}"
    exec "$out/libexec/${name}.AppImage" "$@"
    EOF
        chmod +x $out/bin/my-app
  '';
  }
    
