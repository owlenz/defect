{ config, ... }:
{
  flake.modules.nixos.services =
    { ... }:
    {
      imports = [
        config.flake.modules.nixos.dm
        config.flake.modules.nixos.ssh
        config.flake.modules.nixos.ssh
        config.flake.modules.nixos.x11
        config.flake.modules.nixos.pipewire
      ];
      services = {
        gvfs.enable = true;
        blueman.enable = true;
        xserver.videoDrivers = [ "nvidia" ];
        flatpak.enable = true;
      };
    };
}
