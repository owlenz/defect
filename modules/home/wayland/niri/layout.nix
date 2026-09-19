{
  flake.modules.homeManager.niri = {
    programs.niri.settings.layout = {
      default-column-width.proportion = 1. / 2.;
      preset-column-widths = [
        { proportion = 1. / 3.; }
        { proportion = 1. / 2.; }
        { proportion = 2. / 3.; }
      ];
      gaps = 4;
      focus-ring = {
        enable = true;
        width = 1;
        active = {
          color = "#C4A7E7";
        };
        inactive = {
          color = "#505050";
        };
      };
    };
  };
}
