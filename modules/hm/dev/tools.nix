{pkgs, ...}:
let
in {
  home.packages = with pkgs; [
    # ispell
    # filezilla
    # remmina
  ];
}
