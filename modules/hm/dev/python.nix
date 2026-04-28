{pkgs, ...}:
let
  python = pkgs.python3.withPackages (ps: with ps; [
    pygobject3
  ]);
  mediaplayer = pkgs.writeShellScriptBin "mediaplayer" ''
    export GI_TYPELIB_PATH=${pkgs.playerctl}/lib/girepository-1.0:${pkgs.gobject-introspection}/lib/girepository-1.0
    exec ${python}/bin/python3 /home/owlenz/.config/waybar/scripts/mediaplayer.py "$@"
  '';
in {
  home.packages = with pkgs; [
    python
    mediaplayer
  ];
}
