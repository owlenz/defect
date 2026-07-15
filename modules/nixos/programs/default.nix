{ config, ... }:
{
  flake.modules.nixos.programs =
    { ... }:
    {
      imports = [
        config.flake.modules.nixos.xdg
        config.flake.modules.nixos.hyprland
        config.flake.modules.nixos.fonts
        config.flake.modules.nixos.gaming
        config.flake.modules.nixos.niri
        config.flake.modules.nixos.hyprland
        config.flake.modules.nixos.docker
      ];
    };
}
