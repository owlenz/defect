{ config, ... }:
{
  flake.modules.homeManager.browsers =
    { pkgs, ... }:
    {
      imports = [ config.flake.modules.homeManager.firefox ];
    };
}
