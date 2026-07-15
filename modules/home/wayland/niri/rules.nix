{
  flake.modules.homeManager.niri = {
    programs.niri.settings = {
      window-rules = [
        {
          matches = [ { app-id = "dev.noctalia.Noctalia.Settings"; } ];
          open-floating = true;
          default-column-width.fixed = 1080;
          default-window-height.fixed = 920;
        }
        {
          geometry-corner-radius = {
            bottom-left = 8.0;
            bottom-right = 8.0;
            top-left = 8.0;
            top-right = 8.0;
          };
          clip-to-geometry = true;
          draw-border-with-background = false;
        }
        {
          matches = [
            {
              app-id = "feh";
            }
          ];
          open-floating = true;
        }
        {
          matches = [
            {
              app-id = "steam";
              title = "^notificationtoasts_\d+_desktop$";
            }
          ];
          default-floating-position = {
            x = 10;
            y = 10;
            relative-to = "bottom-right";
          };
          open-floating = true;
        }
      ];
      layer-rules = [
        {
          matches = [ { namespace = "^noctalia-backdrop"; } ];
          place-within-backdrop = true;
        }
      ];
    };
  };
}
