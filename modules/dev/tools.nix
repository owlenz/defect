{pkgs, ...}:
let
in {
  environment.systemPackages = with pkgs; [
    ispell
    filezilla
    remmina
    ffmpeg
  ];
}
