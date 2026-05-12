{
  flake.modules.homeManager.hyprland = {
    services.hyprpaper = {
      enable = true;
      settings = {
        # ipc = "on";
        splash = false;
        splash_offset = 2;

        preload = [
          "~/Pictures/wallpaper/bw.png"
        ];

        wallpaper = [
          {
            monitor = "HDMI-A-1";
            path = "~/Pictures/wallpaper/bw.png";
          }
        ];
      };
    };
  };
}
