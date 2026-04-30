{ lib, makeWrapper, appimageTools }:
let
  pname = "Cider";
  version = "3.1.8";
  src = ./cider.AppImage;
  appimageContents = appimageTools.extractType2 {
    inherit pname version src;
  };
in

appimageTools.wrapType2 {
  inherit pname version src;
  extraInstallCommands = ''
    install -Dm444 ${appimageContents}/${pname}.desktop \
      $out/share/applications/${pname}.desktop

    install -Dm444 ${appimageContents}/${pname}.png \
      $out/share/icons/hicolor/256x256/apps/cider.png

    substituteInPlace $out/share/applications/${pname}.desktop \
      --replace-fail 'Exec=Cider' 'Exec=${pname}'
  '';

  meta = with lib; {
    description = "New look into listening and enjoying Apple Music in style and performance";
    homepage = "https://github.com/ciderapp/Cider";
    license = licenses.agpl3Only;
    mainProgram = "cider";
    platforms = [ "x86_64-linux" ];

  };

}
