{ pkgs, ... }:
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
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = false;
    };
  };

  environment.systemPackages = with pkgs; [
    krita
    qbittorrent
    wineWowPackages.waylandFull
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
    })
  ];
}
