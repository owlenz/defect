{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    inputs.self.packages.x86_64-linux.cider-2
    mpv
    pavucontrol
    ffmpeg
    qbittorrent
  ];
}
