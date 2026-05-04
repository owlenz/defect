{
  flake.modules.homeManager.niri = {
    programs.niri.settings.input = {
      border.off = true;
      focus-ring = {
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
