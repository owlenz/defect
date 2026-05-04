{ config, ... }:
{
  flake.modules.homeManager.browsers =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.chromium ] ;
      imports = [ config.flake.modules.homeManager.firefox ];
    };
}
