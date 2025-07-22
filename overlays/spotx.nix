final: prev:
let
  spotx = prev.fetchurl {
<<<<<<< HEAD
    url = "https://raw.githubusercontent.com/SpotX-Official/SpotX-Bash/5e9b08f91e55c210bbc64715b4ad698186b3c06b/spotx.sh";
    hash = "sha256-mlUc62b7Mw+Rpuiy0kqov5JCfrvKqgHLYfTf221gerM=";
=======
    url = "https://raw.githubusercontent.com/SpotX-Official/SpotX-Bash/c3d4b777081b3cdb52d52b43ac1589c349c87173/spotx.sh";
    hash = "sha256-llEmiObYRo62Duu6jP7TUbFArerijbT/O68raHbRI60=";
>>>>>>> e938fff (cursor, browsers and more)
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
<<<<<<< HEAD
            bash ${spotx} -fh -P "$out/share/spotify"
=======
            bash ${spotx} -feh -P "$out/share/spotify"
>>>>>>> e938fff (cursor, browsers and more)
            runHook postInstall
          ''
        ]
        old.installPhase;
  });
}
