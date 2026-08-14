{ config, ...}:{

  flake.modules.nixos.root =
    { ... }:
    {
      environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
      };
      imports = [
        config.flake.modules.nixos.home
        config.flake.modules.nixos.nix
        config.flake.modules.nixos.programs
        config.flake.modules.nixos.services
        config.flake.modules.nixos.hardware
        config.flake.modules.nixos.pkgs-by-name
      ];
    };
}
