{ config, ... }:
{
  flake.modules.homeManager.media =
    { inputs, pkgs, ... }:
    {
      imports = [
        config.flake.modules.homeManager.kopuz
      ];
      home.packages = with pkgs; [
        local.cider-2
        pavucontrol
        ffmpeg
        qbittorrent
        nicotine-plus
        amberol
      ];
      # programs.mpv.enable = true;
    };
}
