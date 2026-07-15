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
        config.flake.modules.nixos.jellyfin
        config.flake.modules.nixos.arr
        config.flake.modules.nixos.syncthing
        config.flake.modules.nixos.pi-hole
        config.flake.modules.nixos.vaultwarden
        config.flake.modules.nixos.secrets
        config.flake.modules.nixos.ddns
        config.flake.modules.nixos.navidrome
      ];
      services = {
        gvfs.enable = true;
        blueman.enable = true;
        xserver.videoDrivers = [ "nvidia" ];
        flatpak.enable = true;
        # cloudflare-warp.enable = true;
      };
    };
}
