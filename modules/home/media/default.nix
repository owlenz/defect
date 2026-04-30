{ ... }:
{
  flake.modules.homeManager.media =
    { inputs, pkgs, ... }:
    {
      home.packages = with pkgs; [
        local.cider-2
        pavucontrol
        ffmpeg
        qbittorrent
      ];
      # programs.mpv.enable = true;
    };
}
