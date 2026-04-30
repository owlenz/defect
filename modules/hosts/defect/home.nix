{ config, ... }:
{
  flake.modules.homeManager.defectHome =
    { lib, ... }:
    {
      imports = with config.flake.modules.homeManager; [
        root
      ];
    };
}
