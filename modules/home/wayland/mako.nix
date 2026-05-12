{
  flake.modules.homeManager.mako = {...}: {
    services.mako = {
      enable = true;
      settings = {
        default-timeout = 6000;
        margin = 10;
        padding = 10;
        width = 400;
        border-radius = 4;

        ignore-timeout = true;
        
      };
    };
  };
}
