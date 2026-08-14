{ config, ... }:
{
  flake.modules.homeManager.defectHome =
    { lib, ... }:
    {
      imports = [
        config.flake.modules.homeManager.root
        # (config.flake.modules.homeManager.desktop or { })
      ];
    };
}
