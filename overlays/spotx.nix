final: prev:
let
  spotx = prev.fetchurl {
    url = "https://raw.githubusercontent.com/SpotX-Official/SpotX-Bash/c3d4b777081b3cdb52d52b43ac1589c349c87173/spotx.sh";
    hash = "sha256-llEmiObYRo62Duu6jP7TUbFArerijbT/O68raHbRI60=";
  };
in
{
  spotify = prev.spotify.overrideAttrs (old: {
    nativeBuildInputs =
      old.nativeBuildInputs ++ (with prev; [
        util-linux
        perl
        unzip
        zip
        curl
      ]);

    unpackPhase =
      builtins.replaceStrings
        [ "runHook postUnpack" ]
        [
          ''
            patchShebangs --build ${spotx}
            runHook postUnpack
          ''
        ]
        old.unpackPhase;

    installPhase =
      builtins.replaceStrings
        [ "runHook postInstall" ]
        [
          ''
            bash ${spotx} -feh -P "$out/share/spotify"
            runHook postInstall
          ''
        ]
        old.installPhase;
  });
}
