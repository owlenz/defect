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
<<<<<<< HEAD
    enable = false;
    desktopManager = {
      # xterm.enable = true;
      xfce.enable =  false;
    };
  };
  services.gvfs.enable = true;
=======
    enable = true;
    desktopManager = {
      xterm.enable = false;
      xfce.enable = false;
    };
  };
>>>>>>> e938fff (cursor, browsers and more)

  environment.systemPackages = with pkgs; [
    krita
    qbittorrent
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
