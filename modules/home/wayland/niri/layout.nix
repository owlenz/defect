{
  flake.modules.homeManager.niri = {
    programs.niri.settings.layout = {
      default-column-width.proportion = 1. / 2.;
      preset-column-widths = [
        { proportion = 1. / 3.; }
        { proportion = 1. / 2.; }
        { proportion = 2. / 3.; }
      ];
      focus-ring = {
        enable = true;
        width = 2;
        active = {
          color = "#663E90";
        };
        inactive = {
          color = "#505050";
        };
      };
    };
  };
}
