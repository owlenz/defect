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
            bottom-left = 2.0;
            bottom-right = 2.0;
            top-left = 2.0;
            top-right = 2.0;
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
            x = 0;
            y = 0;
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
