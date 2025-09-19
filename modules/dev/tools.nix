{pkgs, ...}:
let
in {
  environment.systemPackages = with pkgs; [
    ispell
    filezilla
    remmina
    ffmpeg
    python3
    python3Packages.pygobject3
  ];
}
