{
  flake.modules.homeManager.noctalia =
    { inputs, ... }:
    {
      imports = [
        inputs.noctalia.homeModules.default
      ];

      programs.noctalia = {
        enable = true;
        settings = {
          theme = {
            mode = "dark";
            source = "wallpaper";
            builtin = "Tokyo-Night";
            wallpaper_scheme = "m3-tonal-spot";
          };

          wallpaper = {
            enabled = true;
            directory = "/home/owlenz/Pictures/wallpapers";
            default = {
              path = "/home/owlenz/Pictures/wallpapers/tongues.png";
            };
          };
          backdrop = {
            enabled = true;
            blur_intensity = 0.5;
            tint_intensity = 0.3;
          };
        };
      };
    };
}
