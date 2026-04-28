{ pkgs, soulseek, ... }:
{
  environment.systemPackages = with pkgs; [
    krita
    anydesk

    # data
    qbittorrent
    soulseek

    # wineWowPackages.stable
    winetricks
    # wineWowPackages.waylandFull

    # nemo
    nautilus

    obs-studio
    (discord.override {
      # withOpenASAR = true;
      withVencord = true;
    })
  ];
}
