final: prev:
let
  spotx = prev.fetchurl {
    url = "https://raw.githubusercontent.com/SpotX-Official/SpotX-Bash/5e9b08f91e55c210bbc64715b4ad698186b3c06b/spotx.sh";
    hash = "sha256-mlUc62b7Mw+Rpuiy0kqov5JCfrvKqgHLYfTf221gerM=";
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
        python3
        python312Packages.pyelftools
        python312Packages.capstone
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
            bash ${spotx} -fh -P "$out/share/spotify"
            runHook postInstall
          ''
        ]
        old.installPhase;
  });
}
