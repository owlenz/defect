{ pkgs, soulseek, ... }:
let

in {
  services.displayManager.ly = {
    enable = true;
  };
  services.picom = {
    enable = false;
    backend = "glx";
    vSync = true;
  };
  services.xserver = {
    xkb = {
      layout = "us,ara";
      variant = ",";
      options = "grp:alt_shift_toggle";
    };
    enable = false;
    desktopManager = {
      # xterm.enable = true;
      xfce.enable =  false;
    };
  };
  services.gvfs.enable = true;

  environment.systemPackages = with pkgs; [
    krita
    anydesk

    # data
    qbittorrent
    soulseek

    wineWowPackages.stable
    winetricks
    wineWowPackages.waylandFull

    nemo
    adwaita-icon-theme

    obs-studio
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];
}
