{
  flake.modules.homeManager.fuzzel = { ... }: {
    programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          width = 40; # width in characters
          horizontal-pad = 20;
          vertical-pad = 12;
          inner-pad = 8;
          lines = 10; # number of visible match lines
          terminal = "foot";
        };
        border = {
          width = 1;
          radius = 2;
        };
      };
    };
  };
}
