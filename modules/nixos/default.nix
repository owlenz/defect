{ config, ...}:{

  flake.modules.nixos.root =
    { ... }:
    {
      imports = [
        config.flake.modules.nixos.home
        config.flake.modules.nixos.programs
        config.flake.modules.nixos.services
        config.flake.modules.nixos.hardware
        config.flake.modules.nixos.pkgs-by-name
      ];
    };
}
