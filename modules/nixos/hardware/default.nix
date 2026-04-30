{ config, ... }:
{
  flake.modules.nixos.hardware =
    { ... }:
    {
      imports = [
        config.flake.modules.nixos.bluetooth
        config.flake.modules.nixos.graphics
      ];
    };
}
