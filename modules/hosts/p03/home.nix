{ config, ... }:
{
  flake.modules.homeManager.p03Home =
    { lib, ... }:
    {
      imports = [
        config.flake.modules.homeManager.root
        # (config.flake.modules.homeManager.desktop or { })
      ];
    };
}
