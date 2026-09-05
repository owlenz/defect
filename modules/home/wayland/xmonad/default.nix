{
  flake.modules.homeManager.xmonad = { pkgs, ... }: {
    xsession.windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      extraPackages = hpkgs: [
        hpkgs.xmonad
        hpkgs.xmonad-extras
        hpkgs.xmonad-contrib
      ];
    };

    services.picom = {
      enable = true;
      backend = "egl";
      vSync = true;
    };
    xsession.initExtra = ''
            sleep 1;
      	   ${pkgs.xwallpaper}/bin/xwallpaper --zoom "$HOME/Pictures/wallpapers/tongues.png"
    '';
  };

}
