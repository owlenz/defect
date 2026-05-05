{
  flake.modules.homeManager.niri = {
    programs.niri.settings = {
      window-rules = [
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
      ];
    };
  };
}
